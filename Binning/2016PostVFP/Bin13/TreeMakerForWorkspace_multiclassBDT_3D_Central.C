#include<iostream>
#include <sstream>  
#include<vector>
#include <bits/stdc++.h>
#include<fstream>
#include<string>
#include <TH2.h>
#include <TStyle.h>
#include <TCanvas.h>
#include <TMVA/Reader.h>

using namespace std;

void TreeMakerForWorkspace_multiclassBDT_3D_Central( int binx, int biny, int binz, int proc, int bin_index, TString year)
{
  
  Float_t cross_Section_ggH = 48.5800;
  Float_t cross_Section_qqH = 3.7820;
  Float_t BR_Hgg =            0.00227;
  double lumi = 0;

  if (year == "2016PreVFP") {
    lumi = 19.52;
  } else if (year == "2016PostVFP") {
    lumi = 16.81;
  } else if (year == "2017") {
    lumi = 41.48;
  } else if (year == "2018") {
    lumi = 59.83;
  } else {
    std::cerr << "Unknown year, not list of run2 data years (2016PreVFP, 2016PostVFP, 2017, 2018) " << year << std::endl;
    return;
  }

  std::cout << "Processing year " << year << " with lumi: " << lumi << std::endl;

  TString fIn[] = {

    "Data",

    "GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8",
    "GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8",
    "GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8",

    "VBFHToGG_M125_TuneCP5_13TeV-amcatnlo-pythia8",
    "VBFHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8",
    "VBFHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8",
        
    "WHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8",
    "WHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8",
    "WHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8",

    "ZH_HToGG_ZToAll_M125_TuneCP5_13TeV-powheg-pythia8",
    "ZHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8",
    "ZHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8",

    "ttHJetToGG_M125_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8",
    "ttHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8",
    "ttHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8"
    
  } ;
 
  int nprocs = sizeof(fIn)/sizeof(fIn[0]);
  float Dzero[6] = {0.0, 0.2, 0.35, 0.65, 0.8, 1.0}; // D0-ggH
  float stxsmva[4] = {0.75, 0.90, 0.975, 1.0}; // STXS MVA ID
  float DCP[3] = {-1.0, 0.0, 1.0};        // DCP-ggH
  
  int tag_num = bin_index;

  int ii = binx; 
  int jj = biny;
  int kk = binz;

  int i = proc;

  std::cout << "Bin structure DCP_ggH | lower : " << DCP[kk] << "  | upper : " << DCP[kk+1] << " && diPho_MVA | lower : " << stxsmva[jj] << "  | upper : "  << stxsmva[jj+1]  << " && D0_minus_ggH | lower  : " << Dzero[ii] << " | upper  : " << Dzero[ii + 1] << std::endl;


   std::cout <<  "processing: output_"  << fIn[i]	 << ".root" << std::endl;

   TString treename;

   if( fIn[i] == "GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8")  treename = "ggh_MM";
   else if ( fIn[i] == "GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8") treename = "ggh_CPodd";
   else if ( fIn[i] == "GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8") treename = "ggh_SM";
   else if ( fIn[i] == "GluGluHToGG_M-125_TuneCP5_13TeV-powheg-pythia8")  treename = "ggh";
   else if ( fIn[i] == "VBFHToGG_M125_TuneCP5_13TeV-amcatnlo-pythia8" || fIn[i] == "VBFHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "VBFHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8"  || fIn[i] == "VBFHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8")  treename = "vbfh";
   else if( fIn[i] ==  "WHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "WHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "WHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8")  treename = "wh";
   else if ( fIn[i] == "ZH_HToGG_ZToAll_M125_TuneCP5_13TeV-powheg-pythia8" || fIn[i] == "ZHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "ZHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "ZHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8") treename = "zh";
   else if ( fIn[i] ==  "ttHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] ==  "ttHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "ttHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "ttHJetToGG_M125_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8" ) treename = "tth";
   else if ( fIn[i] == "Data") treename = "Data";
   else  treename = "bkg";


   std::cout << "Processing trees :  tagsDumper/trees/" << treename  << "_13TeV_VBFTag_2" << std::endl;   
   TString num = to_string(tag_num);

   TString cat = "Bin" + num;
   std::cout << "Filling cat : " << cat << std::endl;
   TFile *f = TFile::Open("/afs/cern.ch/user/j/jhossain/eos/Hgg_AC_analysis/Prod_Ntuples_2024/Prod_Signal/output_" + fIn[i]+"_"+year+".root");

   TString treename_output = treename + "125_13TeV_AC";

   if( fIn[i] == "Data" )                                                       {  treename_output = "Data_13TeV_AC"; }
   if( fIn[i] == "GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8" ) { treename_output = "jjh0Mf05ph0_125_13TeV_AC"; }
   if( fIn[i] == "GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8" )       { treename_output =  "jjh0M_125_13TeV_AC"; }
   if( fIn[i] == "GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8" )      { treename_output = "jjh0P_125_13TeV_AC"; }
   if( fIn[i] == "VBFHToGG_M125_TuneCP5_13TeV-amcatnlo-pythia8" )     { treename_output = "vbf0P_125_13TeV_AC"; }
   if( fIn[i] == "VBFHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" ){treename_output = "vbf0Mf05ph0_125_13TeV_AC"; }
   if( fIn[i] == "VBFHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" )      { treename_output = "vbf0M_125_13TeV_AC"; }
   if( fIn[i] == "WHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" ) { treename_output = "wh0Mf05ph0_125_13TeV_AC"; }
   if( fIn[i] == "WHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" )       { treename_output = "wh0M_125_13TeV_AC"; }
   if( fIn[i] == "WHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" )      { treename_output = "wh0P_125_13TeV_AC"; }
   if( fIn[i] == "ZH_HToGG_ZToAll_M125_TuneCP5_13TeV-powheg-pythia8" || fIn[i] == "ZHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" )     { treename_output = "zh0P_125_13TeV_AC"; }
   if( fIn[i] == "ZHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" ){treename_output = "zh0Mf05ph0_125_13TeV_AC"; }
   if( fIn[i] == "ZHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" )      { treename_output = "zh0M_125_13TeV_AC"; }
   if( fIn[i] == "ttHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "ttHJetToGG_M125_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8")     { treename_output = "tth0P_125_13TeV_AC"; }
   if( fIn[i] == "ttHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" ){treename_output = "tth0Mf05ph0_125_13TeV_AC"; }
   if( fIn[i] == "ttHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" )      { treename_output = "tth0M_125_13TeV_AC"; }

   //if ( fIn[i] == "Data") TFile *fileout = new TFile("output_" + fIn[i] + ".root","recreate");
   TFile *fileout = new TFile("output_" + fIn[i] + "_central.root","recreate");

   TDirectory* folder = fileout->mkdir("tagsDumper");
   folder->cd();
   TDirectory* trees = folder->mkdir("trees");
   trees->cd();
   
   TTree *Tout = new TTree( treename_output+"_"+cat, treename_output+"_"+cat );
   Float_t         weight_;
   Float_t         CMS_hgg_mass_;
   Float_t         dZ_;
   Float_t         mjj_;
   Float_t         D_0_ggH_;
   Float_t         dipho_mva_;

   Float_t FracRVWeightDown01sigma_, FracRVWeightUp01sigma_, JetBTagCutWeightDown01sigma_, JetBTagCutWeightUp01sigma_;
   Float_t LooseMvaSFDown01sigma_, LooseMvaSFUp01sigma_, NNLOPSweight_, PreselSFDown01sigma_;
   Float_t PreselSFUp01sigma_, THU_ggH_Mig01Down01sigma_, THU_ggH_Mig01Up01sigma_, THU_ggH_Mig12Down01sigma_, THU_ggH_Mig12Up01sigma_;
   Float_t THU_ggH_MuDown01sigma_, THU_ggH_MuUp01sigma_, THU_ggH_PT120Down01sigma_, THU_ggH_PT120Up01sigma_, THU_ggH_PT60Down01sigma_;
   Float_t THU_ggH_PT60Up01sigma_, THU_ggH_ResDown01sigma_, THU_ggH_ResUp01sigma_, THU_ggH_VBF2jDown01sigma_, THU_ggH_VBF2jUp01sigma_;
   Float_t THU_ggH_VBF3jDown01sigma_, THU_ggH_VBF3jUp01sigma_, THU_ggH_qmtopDown01sigma_, THU_ggH_qmtopUp01sigma_, TriggerWeightDown01sigma_;
   Float_t TriggerWeightUp01sigma_, centralObjectWeight_;
   Float_t  electronVetoSFDown01sigma_, electronVetoSFUp01sigma_;



   Tout->Branch("weight", &weight_, "weight/F");
   Tout->Branch("CMS_hgg_mass", &CMS_hgg_mass_, "CMS_hgg_mass/F");
   Tout->Branch("dZ", &dZ_, "dZ/F");

//   Tout->Branch("mjj", &mjj_, "mjj/F");
//   Tout->Branch("D_0_ggH", &D_0_ggH_, "D_0_ggH/F");
//   Tout->Branch("dipho_mva", &dipho_mva_, "dipho_mva/F");

   Tout->Branch("FracRVWeightDown01sigma", &FracRVWeightDown01sigma_, "FracRVWeightDown01sigma/F");
   Tout->Branch("FracRVWeightUp01sigma", &FracRVWeightUp01sigma_, "FracRVWeightUp01sigma/F");
   Tout->Branch("LooseMvaSFDown01sigma", &LooseMvaSFDown01sigma_, "LooseMvaSFDown01sigma/F");
   Tout->Branch("LooseMvaSFUp01sigma", &LooseMvaSFUp01sigma_, "LooseMvaSFUp01sigma/F");
   Tout->Branch("NNLOPSweight", &NNLOPSweight_, "NNLOPSweight/F");
   Tout->Branch("PreselSFDown01sigma", &PreselSFDown01sigma_, "PreselSFDown01sigma/F");
   Tout->Branch("PreselSFUp01sigma", &PreselSFUp01sigma_, "PreselSFUp01sigma/F");
   Tout->Branch("THU_ggH_Mig01Down01sigma", &THU_ggH_Mig01Down01sigma_, "THU_ggH_Mig01Down01sigma/F");
   Tout->Branch("THU_ggH_Mig01Up01sigma", &THU_ggH_Mig01Up01sigma_, "THU_ggH_Mig01Up01sigma/F");
   Tout->Branch("THU_ggH_Mig12Down01sigma", &THU_ggH_Mig12Down01sigma_, "THU_ggH_Mig12Down01sigma/F");
   Tout->Branch("THU_ggH_Mig12Up01sigma", &THU_ggH_Mig12Up01sigma_, "THU_ggH_Mig12Up01sigma/F");
   Tout->Branch("THU_ggH_MuDown01sigma", &THU_ggH_MuDown01sigma_, "THU_ggH_MuDown01sigma/F");
   Tout->Branch("THU_ggH_MuUp01sigma", &THU_ggH_MuUp01sigma_, "THU_ggH_MuUp01sigma/F");
   Tout->Branch("THU_ggH_PT120Down01sigma", &THU_ggH_PT120Down01sigma_, "THU_ggH_PT120Down01sigma/F");
   Tout->Branch("THU_ggH_PT120Up01sigma", &THU_ggH_PT120Up01sigma_, "THU_ggH_PT120Up01sigma/F");
   Tout->Branch("THU_ggH_PT60Down01sigma", &THU_ggH_PT60Down01sigma_, "THU_ggH_PT60Down01sigma/F");
   Tout->Branch("THU_ggH_PT60Up01sigma", &THU_ggH_PT60Up01sigma_, "THU_ggH_PT60Up01sigma/F");
   Tout->Branch("THU_ggH_ResDown01sigma", &THU_ggH_ResDown01sigma_, "THU_ggH_ResDown01sigma/F");
   Tout->Branch("THU_ggH_ResUp01sigma", &THU_ggH_ResUp01sigma_, "THU_ggH_ResUp01sigma/F");
   Tout->Branch("THU_ggH_VBF2jDown01sigma", &THU_ggH_VBF2jDown01sigma_, "THU_ggH_VBF2jDown01sigma/F");
   Tout->Branch("THU_ggH_VBF2jUp01sigma", &THU_ggH_VBF2jUp01sigma_, "THU_ggH_VBF2jUp01sigma/F");
   Tout->Branch("THU_ggH_VBF3jDown01sigma", &THU_ggH_VBF3jDown01sigma_, "THU_ggH_VBF3jDown01sigma/F");
   Tout->Branch("THU_ggH_VBF3jUp01sigma", &THU_ggH_VBF3jUp01sigma_, "THU_ggH_VBF3jUp01sigma/F");
   Tout->Branch("THU_ggH_qmtopDown01sigma", &THU_ggH_qmtopDown01sigma_, "THU_ggH_qmtopDown01sigma/F");
   Tout->Branch("THU_ggH_qmtopUp01sigma", &THU_ggH_qmtopUp01sigma_, "THU_ggH_qmtopUp01sigma/F");
   Tout->Branch("TriggerWeightDown01sigma", &TriggerWeightDown01sigma_, "TriggerWeightDown01sigma/F");
   Tout->Branch("TriggerWeightUp01sigma", &TriggerWeightUp01sigma_, "TriggerWeightUp01sigma/F");
   Tout->Branch("centralObjectWeight", &centralObjectWeight_, "centralObjectWeight/F");
   Tout->Branch("electronVetoSFDown01sigma", &electronVetoSFDown01sigma_, "electronVetoSFDown01sigma/F");
   Tout->Branch("electronVetoSFUp01sigma", &electronVetoSFUp01sigma_, "electronVetoSFUp01sigma/F");

   ULong64_t       event;
   Float_t         weight;
   Float_t         CMS_hgg_mass;
   Float_t         dZ;

   Float_t         dijet_leadPt;
   Float_t         dijet_subleadPt;
   Float_t         dijet_leadEta;
   Float_t         dijet_subleadEta;
   Float_t         dijet_Mjj;
   Float_t         dijet_abs_dEta;
   Float_t         dijet_leadPhi;
   Float_t         dijet_subleadPhi;
   Float_t         dijet_zep;
   Float_t         dijet_dphi;
   Float_t         cos_dijet_dipho_dphi;
   Float_t         dijet_minDRJetPho;


   Float_t         dipho_lead_ptoM;
   Float_t         dipho_sublead_ptoM;
   Float_t         dipho_leadIDMVA;
   Float_t         dipho_subleadIDMVA;
   Float_t         dipho_mva;
   Float_t         D0_minus_ggH;
   Float_t         D_CP_ggH;
   Float_t         dipho_sumpt;
   Float_t         dipho_leadEta;
   Float_t         dipho_subleadEta;
   Float_t         dipho_cosphi;
   Float_t         dipho_leadPhi;
   Float_t         dipho_subleadPhi;
   Float_t         dipho_leadPt;
   Float_t         dipho_subleadPt;


   // Declare the theory systemetics variables
   Float_t FracRVWeightDown01sigma, FracRVWeightUp01sigma, LooseMvaSFDown01sigma, LooseMvaSFUp01sigma;
   Float_t NNLOPSweight, PreselSFDown01sigma;
   Float_t PreselSFUp01sigma, THU_ggH_Mig01Down01sigma, THU_ggH_Mig01Up01sigma, THU_ggH_Mig12Down01sigma, THU_ggH_Mig12Up01sigma;
   Float_t THU_ggH_MuDown01sigma, THU_ggH_MuUp01sigma, THU_ggH_PT120Down01sigma, THU_ggH_PT120Up01sigma, THU_ggH_PT60Down01sigma;
   Float_t THU_ggH_PT60Up01sigma, THU_ggH_ResDown01sigma, THU_ggH_ResUp01sigma, THU_ggH_VBF2jDown01sigma, THU_ggH_VBF2jUp01sigma;
   Float_t THU_ggH_VBF3jDown01sigma, THU_ggH_VBF3jUp01sigma, THU_ggH_qmtopDown01sigma, THU_ggH_qmtopUp01sigma, TriggerWeightDown01sigma;
   Float_t TriggerWeightUp01sigma,centralObjectWeight, electronVetoSFDown01sigma, electronVetoSFUp01sigma;

   TBranch        *b_event;
   TBranch        *b_weight;   //!
   TBranch        *b_CMS_hgg_mass;   
   TBranch        *b_dZ;
   TBranch        *b_dijet_leadEta;   
   TBranch        *b_dijet_subleadEta;   
   TBranch        *b_dijet_leadPt;   
   TBranch        *b_dijet_subleadPt;   
   TBranch        *b_dijet_Mjj;
   TBranch        *b_dipho_mva;
   TBranch        *b_dipho_lead_ptoM;
   TBranch        *b_dipho_sublead_ptoM;
   TBranch 	  *b_dipho_leadIDMVA; 
   TBranch        *b_dipho_subleadIDMVA;
   TBranch        *b_D0_minus_ggH;
   TBranch        *b_D_CP_ggH;
   TBranch	  *b_dipho_sumpt;
   TBranch        *b_dipho_leadEta;
   TBranch        *b_dipho_subleadEta;
   TBranch        *b_dijet_abs_dEta;
   TBranch	  *b_dijet_leadPhi;
   TBranch	  *b_dijet_subleadPhi;
   TBranch        *b_dipho_leadPt, *b_dipho_subleadPt, *b_dipho_cosphi, *b_dipho_leadPhi, *b_dipho_subleadPhi, *b_dijet_zep, *b_dijet_dphi, *b_cos_dijet_dipho_dphi, *b_dijet_minDRJetPho, *b_dijet_cosphi, *b_dijet_cosomega;



   // Declare the branches for systemetics
   TBranch *b_FracRVWeightDown01sigma, *b_FracRVWeightUp01sigma;
   TBranch *b_LooseMvaSFDown01sigma, *b_LooseMvaSFUp01sigma;
   TBranch *b_NNLOPSweight, *b_PreselSFDown01sigma;
   TBranch *b_PreselSFUp01sigma, *b_THU_ggH_Mig01Down01sigma, *b_THU_ggH_Mig01Up01sigma, *b_THU_ggH_Mig12Down01sigma, *b_THU_ggH_Mig12Up01sigma;
   TBranch *b_THU_ggH_MuDown01sigma, *b_THU_ggH_MuUp01sigma, *b_THU_ggH_PT120Down01sigma, *b_THU_ggH_PT120Up01sigma, *b_THU_ggH_PT60Down01sigma;
   TBranch *b_THU_ggH_PT60Up01sigma, *b_THU_ggH_ResDown01sigma, *b_THU_ggH_ResUp01sigma, *b_THU_ggH_VBF2jDown01sigma, *b_THU_ggH_VBF2jUp01sigma;
   TBranch *b_THU_ggH_VBF3jDown01sigma, *b_THU_ggH_VBF3jUp01sigma, *b_THU_ggH_qmtopDown01sigma, *b_THU_ggH_qmtopUp01sigma, *b_TriggerWeightDown01sigma;
   TBranch *b_TriggerWeightUp01sigma, *b_centralObjectWeight, *b_electronVetoSFDown01sigma, *b_electronVetoSFUp01sigma;

   TTree *fChain;
   fChain = (TTree*)f->Get("tagsDumper/trees/" + treename + "_13TeV_VBFTag_2");

   fChain->SetBranchAddress("event", &event, &b_event);
   fChain->SetBranchAddress("weight", &weight, &b_weight);
   fChain->SetBranchAddress("CMS_hgg_mass", &CMS_hgg_mass, &b_CMS_hgg_mass);
   fChain->SetBranchAddress("dZ", &dZ, &b_dZ);

   fChain->SetBranchAddress("dijet_leadEta", &dijet_leadEta, &b_dijet_leadEta);
   fChain->SetBranchAddress("dijet_subleadEta", &dijet_subleadEta, &b_dijet_subleadEta);
   fChain->SetBranchAddress("dijet_leadPt", &dijet_leadPt, &b_dijet_leadPt);
   fChain->SetBranchAddress("dijet_subleadPt", &dijet_subleadPt, &b_dijet_subleadPt);
   fChain->SetBranchAddress("dijet_Mjj", &dijet_Mjj , &b_dijet_Mjj);
   fChain->SetBranchAddress("dijet_leadPhi", &dijet_leadPhi , &b_dijet_leadPhi);
   fChain->SetBranchAddress("dijet_subleadPhi", &dijet_subleadPhi , &b_dijet_subleadPhi);
   fChain->SetBranchAddress("dijet_abs_dEta", &dijet_abs_dEta, &b_dijet_abs_dEta);
   fChain->SetBranchAddress("dijet_zep", &dijet_zep, &b_dijet_zep);
   fChain->SetBranchAddress("dijet_dphi", &dijet_dphi, &b_dijet_dphi);
   fChain->SetBranchAddress("cos_dijet_dipho_dphi", &cos_dijet_dipho_dphi, &b_cos_dijet_dipho_dphi);
   fChain->SetBranchAddress("dijet_minDRJetPho", &dijet_minDRJetPho, &b_dijet_minDRJetPho);


   fChain->SetBranchAddress("dipho_mva",&dipho_mva ,&b_dipho_mva);
   fChain->SetBranchAddress("dipho_leadIDMVA",&dipho_leadIDMVA, &b_dipho_leadIDMVA);
   fChain->SetBranchAddress("dipho_subleadIDMVA",&dipho_subleadIDMVA, &b_dipho_subleadIDMVA);
   fChain->SetBranchAddress("dipho_lead_ptoM", &dipho_lead_ptoM, &b_dipho_lead_ptoM);
   fChain->SetBranchAddress("dipho_sublead_ptoM", &dipho_sublead_ptoM, &b_dipho_sublead_ptoM);
   fChain->SetBranchAddress("D0_minus_ggH", &D0_minus_ggH, &b_D0_minus_ggH);
   fChain->SetBranchAddress("D_CP_ggH", &D_CP_ggH, &b_D_CP_ggH);   
   fChain->SetBranchAddress("dipho_sumpt", &dipho_sumpt, &b_dipho_sumpt);
   fChain->SetBranchAddress("dipho_leadEta", &dipho_leadEta, &b_dipho_leadEta);
   fChain->SetBranchAddress("dipho_subleadEta", &dipho_subleadEta, &b_dipho_subleadEta);
   fChain->SetBranchAddress("dipho_cosphi", &dipho_cosphi, &b_dipho_cosphi);
   fChain->SetBranchAddress("dipho_leadPhi", &dipho_leadPhi, &b_dipho_leadPhi);
   fChain->SetBranchAddress("dipho_subleadPhi", &dipho_subleadPhi, &b_dipho_subleadPhi);
   fChain->SetBranchAddress("dipho_leadPt", &dipho_leadPt, &b_dipho_leadPt);
   fChain->SetBranchAddress("dipho_subleadPt", &dipho_subleadPt, &b_dipho_subleadPt);

   // Set branch addresses for Syst variables

   fChain->SetBranchAddress("FracRVWeightDown01sigma", &FracRVWeightDown01sigma, &b_FracRVWeightDown01sigma);
   fChain->SetBranchAddress("FracRVWeightUp01sigma", &FracRVWeightUp01sigma, &b_FracRVWeightUp01sigma);
   fChain->SetBranchAddress("LooseMvaSFDown01sigma", &LooseMvaSFDown01sigma, &b_LooseMvaSFDown01sigma);
   fChain->SetBranchAddress("LooseMvaSFUp01sigma", &LooseMvaSFUp01sigma, &b_LooseMvaSFUp01sigma);
   fChain->SetBranchAddress("NNLOPSweight", &NNLOPSweight, &b_NNLOPSweight);
   fChain->SetBranchAddress("PreselSFDown01sigma", &PreselSFDown01sigma, &b_PreselSFDown01sigma);
   fChain->SetBranchAddress("PreselSFUp01sigma", &PreselSFUp01sigma, &b_PreselSFUp01sigma);
   fChain->SetBranchAddress("THU_ggH_Mig01Down01sigma", &THU_ggH_Mig01Down01sigma, &b_THU_ggH_Mig01Down01sigma);
   fChain->SetBranchAddress("THU_ggH_Mig01Up01sigma", &THU_ggH_Mig01Up01sigma, &b_THU_ggH_Mig01Up01sigma);
   fChain->SetBranchAddress("THU_ggH_Mig12Down01sigma", &THU_ggH_Mig12Down01sigma, &b_THU_ggH_Mig12Down01sigma);
   fChain->SetBranchAddress("THU_ggH_Mig12Up01sigma", &THU_ggH_Mig12Up01sigma, &b_THU_ggH_Mig12Up01sigma);
   fChain->SetBranchAddress("THU_ggH_MuDown01sigma", &THU_ggH_MuDown01sigma, &b_THU_ggH_MuDown01sigma);
   fChain->SetBranchAddress("THU_ggH_MuUp01sigma", &THU_ggH_MuUp01sigma, &b_THU_ggH_MuUp01sigma);
   fChain->SetBranchAddress("THU_ggH_PT120Down01sigma", &THU_ggH_PT120Down01sigma, &b_THU_ggH_PT120Down01sigma);
   fChain->SetBranchAddress("THU_ggH_PT120Up01sigma", &THU_ggH_PT120Up01sigma, &b_THU_ggH_PT120Up01sigma);
   fChain->SetBranchAddress("THU_ggH_PT60Down01sigma", &THU_ggH_PT60Down01sigma, &b_THU_ggH_PT60Down01sigma);
   fChain->SetBranchAddress("THU_ggH_PT60Up01sigma", &THU_ggH_PT60Up01sigma, &b_THU_ggH_PT60Up01sigma);
   fChain->SetBranchAddress("THU_ggH_ResDown01sigma", &THU_ggH_ResDown01sigma, &b_THU_ggH_ResDown01sigma);
   fChain->SetBranchAddress("THU_ggH_ResUp01sigma", &THU_ggH_ResUp01sigma, &b_THU_ggH_ResUp01sigma);
   fChain->SetBranchAddress("THU_ggH_VBF2jDown01sigma", &THU_ggH_VBF2jDown01sigma, &b_THU_ggH_VBF2jDown01sigma);
   fChain->SetBranchAddress("THU_ggH_VBF2jUp01sigma", &THU_ggH_VBF2jUp01sigma, &b_THU_ggH_VBF2jUp01sigma);
   fChain->SetBranchAddress("THU_ggH_VBF3jDown01sigma", &THU_ggH_VBF3jDown01sigma, &b_THU_ggH_VBF3jDown01sigma);
   fChain->SetBranchAddress("THU_ggH_VBF3jUp01sigma", &THU_ggH_VBF3jUp01sigma, &b_THU_ggH_VBF3jUp01sigma);
   fChain->SetBranchAddress("THU_ggH_qmtopDown01sigma", &THU_ggH_qmtopDown01sigma, &b_THU_ggH_qmtopDown01sigma);
   fChain->SetBranchAddress("THU_ggH_qmtopUp01sigma", &THU_ggH_qmtopUp01sigma, &b_THU_ggH_qmtopUp01sigma);
   fChain->SetBranchAddress("TriggerWeightDown01sigma", &TriggerWeightDown01sigma, &b_TriggerWeightDown01sigma);
   fChain->SetBranchAddress("TriggerWeightUp01sigma", &TriggerWeightUp01sigma, &b_TriggerWeightUp01sigma);
   fChain->SetBranchAddress("centralObjectWeight", &centralObjectWeight, &b_centralObjectWeight);
   fChain->SetBranchAddress("electronVetoSFDown01sigma", &electronVetoSFDown01sigma, &b_electronVetoSFDown01sigma);
   fChain->SetBranchAddress("electronVetoSFUp01sigma", &electronVetoSFUp01sigma, &b_electronVetoSFUp01sigma);

   //MVA Reader

   //Additional MVA vatriables
   Float_t dipho_mass;
   Float_t dipho_H_0T, dipho_H_1T, dipho_H_2T;
   Float_t dijet_cosphi, dijet_cosomega;
 
   TString weightFile_= "TMVAClassification__BDT_Xgrad_multiclass_CPodd_threeclass_VBF.weights.xml";
   TString model_= "BDT_Xgrad_Pray";

   TMVA::Reader *reader = new TMVA::Reader( "!Color:Silent" );

   reader->AddSpectator("dipho_mass", &dipho_mass);   

   reader->AddVariable("dipho_cosphi", &dipho_cosphi);
   reader->AddVariable("dipho_leadEta", &dipho_leadEta);
   reader->AddVariable("dipho_lead_ptoM", &dipho_lead_ptoM);
   reader->AddVariable("dipho_subleadEta", &dipho_subleadEta);
   reader->AddVariable("dipho_sublead_ptoM", &dipho_sublead_ptoM);
   reader->AddVariable("dijet_zep", &dijet_zep);
   reader->AddVariable("dijet_minDRJetPho", &dijet_minDRJetPho);
   reader->AddVariable("dijet_leadEta", &dijet_leadEta);
   reader->AddVariable("dijet_leadPt", &dijet_leadPt);
   reader->AddVariable("dijet_subleadEta", &dijet_subleadEta);
   reader->AddVariable("dijet_subleadPt", &dijet_subleadPt);


   std::string Pho_theta1 = "2 * atan(exp(-dipho_leadEta))";
   std::string Pho_theta2 = "2 * atan(exp(-dipho_subleadEta))";
   std::string Dipho_cosomega     = "(cos("+Pho_theta1 +")*cos("+Pho_theta2+")+sin("+Pho_theta1+")*sin("+Pho_theta2+")*cos(dipho_leadPhi-dipho_subleadPhi))";
   std::string Dipho_weight   = "(dipho_leadPt*dipho_subleadPt)/dipho_sumpt**2";

   std::string Dijet_Cosphi = "cos(dijet_leadPhi-dijet_subleadPhi)";
   std::string Dijet_Cosomega = "(cos(2*atan(exp(-dijet_leadEta)))*cos(2*atan(exp(-dijet_subleadEta)))+sin(2*atan(exp(-dijet_leadEta)))*sin(2*atan(exp(-dijet_subleadEta)))*cos(dijet_leadPhi-dijet_subleadPhi))";


   reader->AddVariable(("dipho_H_1T := " + Dipho_weight + " * " + Dipho_cosomega).c_str(), &dipho_H_1T);
   reader->AddVariable(("dipho_H_2T := " + Dipho_weight + " * 0.5 * (3 * " + Dipho_cosomega + "**2 - 1)").c_str(), &dipho_H_2T);

   reader->AddVariable(("dijet_cosphi :=" + Dijet_Cosphi).c_str(), &dijet_cosphi);
   reader->AddVariable(("dijet_cosomega :=" + Dijet_Cosomega).c_str(), &dijet_cosomega);


   reader->BookMVA(model_, weightFile_);

   Float_t ggh_CPodd_score = -999.99;
   Float_t Signal_score = -999.99;
   Float_t Background_score = -999.99;
   Float_t Background_scoremax = 0.6;
   Float_t ggh_CPodd_scoremin = 0.30;

   int cut = 0;
   int passedEntries = 0;
   float tot_wt = 0.0;
   float tot_sq_wt = 0.0;
   int nentries = fChain->GetEntries();
   cout<<"nentries "<<nentries<<endl;

   
   for (int ij=0; ij<nentries; ij++) 
   {
      fChain->GetEntry(ij);

      bool isBlindedRegion = (CMS_hgg_mass > 115 && CMS_hgg_mass < 135);

      Float_t pho_theta1 = 2 * atan(exp(-dipho_leadEta));
      Float_t pho_theta2 = 2 * atan(exp(-dipho_subleadEta));
      Float_t dipho_cosomega = cos(pho_theta1) * cos(pho_theta2) + sin(pho_theta1) * sin(pho_theta2) * cos(dipho_leadPhi - dipho_subleadPhi);
      Float_t dipho_weight   = (dipho_leadPt * dipho_subleadPt) / pow(dipho_sumpt, 2);

      dijet_cosphi = cos(dijet_leadPhi - dijet_subleadPhi);
      dijet_cosomega = (cos(2*atan(exp(-dijet_leadEta)))*cos(2*atan(exp(-dijet_subleadEta)))+sin(2*atan(exp(-dijet_leadEta)))*sin(2*atan(exp(-dijet_subleadEta)))*cos(dijet_leadPhi - dijet_subleadPhi));

      dipho_H_1T = dipho_weight * dipho_cosomega;
      dipho_H_2T = dipho_weight * 0.5 * (3.0 * pow(dipho_cosomega,2) - 1);


      std::vector<Float_t> multi_class_result = reader->EvaluateMulticlass(model_);      

      Signal_score       = multi_class_result[0];
      Background_score   = multi_class_result[1];
      ggh_CPodd_score    = multi_class_result[2];
  
      /* 
	 // Required for debugging

	cout << "event : " << event << " entrie :" << ij <<  " ggh_CPodd_score : " << ggh_CPodd_score <<endl;
	cout << "dipho_leadEta : " << dipho_leadEta << " dipho_cosphi : " << dipho_cosphi << " dijet_zep : " << dijet_zep <<endl;
	cout << "dipho_lead_ptoM : " << dipho_lead_ptoM << " dipho_subleadEta : " << dipho_subleadEta << endl;
	cout << "dipho_sublead_ptoM : "  << dipho_sublead_ptoM << " dijet_zep : " << dijet_zep << " dijet_minDRJetPho : " << dijet_minDRJetPho << endl;
	cout << "dijet_leadEta : " << dijet_leadEta << " dijet_leadPt :" << dijet_leadPt << " dijet_subleadEta : " << dijet_subleadEta << endl;
	cout << "dijet_subleadEta : " << dijet_subleadEta << " dijet_subleadPt : " << dijet_subleadPt << endl; 
	cout << "dijet_cosphi : " << dijet_cosphi << " dijet_cosomega : " << dijet_cosomega << endl;
	cout << "dipho_H_1T : " << dipho_H_1T << "dipho_H_2T : " << dipho_H_2T << endl;     
      */

      if (Background_score > Background_scoremax) continue;

      if (ggh_CPodd_score < ggh_CPodd_scoremin) continue;
	   
      if (!(CMS_hgg_mass > 100 && CMS_hgg_mass < 180 && dipho_lead_ptoM > 0.33 && dipho_sublead_ptoM > 0.25 && dijet_leadPt > 30.0 &&  dijet_subleadPt > 30.0 && fabs(dijet_leadEta) < 4.7 && fabs(dijet_subleadEta) < 4.7 && dijet_abs_dEta > 0.0 && fabs(dipho_leadEta) < 2.5 && fabs(dipho_subleadEta) < 2.5 && (fabs(dipho_leadEta) < 1.44 || fabs(dipho_leadEta) > 1.57) && (fabs(dipho_subleadEta) < 1.44 || fabs(dipho_subleadEta) > 1.57) && dipho_leadIDMVA > -0.2 && dipho_subleadIDMVA > -0.2)) continue;

      if(!(D0_minus_ggH >= Dzero[ii] && D0_minus_ggH < Dzero[ii+1]  && dipho_mva >= stxsmva[jj] && dipho_mva < stxsmva[jj + 1] && D_CP_ggH >= DCP[kk] && D_CP_ggH < DCP[kk + 1])) continue; 

      if (fIn[i] == "Data")  
	
     {

     weight_ = weight;
     CMS_hgg_mass_ = CMS_hgg_mass;
     dZ_ = 0.0;
     tot_wt += weight_; // Sum of weights                                                                                                                               
     tot_sq_wt += weight_ * weight_; // Sum of squared weights
     //passedEntries++;

     FracRVWeightUp01sigma_ = 0.0;
     LooseMvaSFDown01sigma_ = 0.0;
     LooseMvaSFUp01sigma_ = 0.0;
     NNLOPSweight_ = 0.0;
     PreselSFDown01sigma_ = 0.0;
     PreselSFUp01sigma_ = 0.0;
     THU_ggH_Mig01Down01sigma_ = 0.0;
     THU_ggH_Mig01Up01sigma_ = 0.0;
     THU_ggH_Mig12Down01sigma_ = 0.0;
     THU_ggH_Mig12Up01sigma_ = 0.0;
     THU_ggH_MuDown01sigma_ = 0.0;
     THU_ggH_MuUp01sigma_ = 0.0;
     THU_ggH_PT120Down01sigma_ = 0.0;
     THU_ggH_PT120Up01sigma_ = 0.0;
     THU_ggH_PT60Down01sigma_ = 0.0;
     THU_ggH_PT60Up01sigma_ = 0.0;
     THU_ggH_ResDown01sigma_ = 0.0;
     THU_ggH_ResUp01sigma_ = 0.0;
     THU_ggH_VBF2jDown01sigma_ = 0.0;
     THU_ggH_VBF2jUp01sigma_ = 0.0;
     THU_ggH_VBF3jDown01sigma_ = 0.0;
     THU_ggH_VBF3jUp01sigma_ = 0.0;
     THU_ggH_qmtopDown01sigma_ = 0.0;
     THU_ggH_qmtopUp01sigma_ = 0.0;
     TriggerWeightDown01sigma_ = 0.0;
     TriggerWeightUp01sigma_ = 0.0;
     centralObjectWeight_ = 0.0;
     electronVetoSFDown01sigma_ = 0.0;
     electronVetoSFUp01sigma_ = 0.0;

     } //loop for Data ntuples
     
     else if(fIn[i] == "GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8" || fIn[i] == "GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8"  || fIn[i] == "GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8" || fIn[i] == "VBFHToGG_M125_TuneCP5_13TeV-amcatnlo-pythia8" || fIn[i] == "WHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "WHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "WHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "ZH_HToGG_ZToAll_M125_TuneCP5_13TeV-powheg-pythia8" || fIn[i] == "ZHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "ZHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "ZHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "ttHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "ttHJetToGG_M125_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8" || fIn[i] == "ttHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" || fIn[i] == "ttHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8")

     {

     weight_ = weight;
     CMS_hgg_mass_ = CMS_hgg_mass;
     dZ_ = dZ;
     tot_wt = tot_wt + weight_ * lumi;
     tot_sq_wt += weight_ * lumi * weight_ * lumi; // Sum of squared weights
     // passedEntries++;

     
     FracRVWeightDown01sigma_ = FracRVWeightDown01sigma;
     FracRVWeightUp01sigma_ = FracRVWeightUp01sigma;
     LooseMvaSFDown01sigma_ = LooseMvaSFDown01sigma;
     LooseMvaSFUp01sigma_ = LooseMvaSFUp01sigma;
     NNLOPSweight_ = NNLOPSweight;
     PreselSFDown01sigma_ = PreselSFDown01sigma;
     PreselSFUp01sigma_ = PreselSFUp01sigma;
     THU_ggH_Mig01Down01sigma_ = THU_ggH_Mig01Down01sigma;
     THU_ggH_Mig01Up01sigma_ = THU_ggH_Mig01Up01sigma;
     THU_ggH_Mig12Down01sigma_ = THU_ggH_Mig12Down01sigma;
     THU_ggH_Mig12Up01sigma_ = THU_ggH_Mig12Up01sigma;
     THU_ggH_MuDown01sigma_ = THU_ggH_MuDown01sigma;
     THU_ggH_MuUp01sigma_ = THU_ggH_MuUp01sigma;
     THU_ggH_PT120Down01sigma_ = THU_ggH_PT120Down01sigma;
     THU_ggH_PT120Up01sigma_ = THU_ggH_PT120Up01sigma;
     THU_ggH_PT60Down01sigma_ = THU_ggH_PT60Down01sigma;
     THU_ggH_PT60Up01sigma_ = THU_ggH_PT60Up01sigma;
     THU_ggH_ResDown01sigma_ = THU_ggH_ResDown01sigma;
     THU_ggH_ResUp01sigma_ = THU_ggH_ResUp01sigma;
     THU_ggH_VBF2jDown01sigma_ = THU_ggH_VBF2jDown01sigma;
     THU_ggH_VBF2jUp01sigma_ = THU_ggH_VBF2jUp01sigma;
     THU_ggH_VBF3jDown01sigma_ = THU_ggH_VBF3jDown01sigma;
     THU_ggH_VBF3jUp01sigma_ = THU_ggH_VBF3jUp01sigma;
     THU_ggH_qmtopDown01sigma_ = THU_ggH_qmtopDown01sigma;
     THU_ggH_qmtopUp01sigma_ = THU_ggH_qmtopUp01sigma;
     TriggerWeightDown01sigma_ = TriggerWeightDown01sigma;
     TriggerWeightUp01sigma_ = TriggerWeightUp01sigma;
     centralObjectWeight_ = centralObjectWeight;
     electronVetoSFDown01sigma_ = electronVetoSFDown01sigma;
     electronVetoSFUp01sigma_ = electronVetoSFUp01sigma;


     } // ggh & other higgs ntuples

    else if( fIn[i] == "VBFHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8") 

    {

     weight_ = weight*0.40;
     CMS_hgg_mass_ = CMS_hgg_mass;
     dZ_ = dZ;
     tot_wt = tot_wt + weight_*lumi ;
     tot_sq_wt += weight_ *lumi * weight_ *lumi; // Sum of squared weights                                                            //passedEntries++;

     FracRVWeightDown01sigma_ = FracRVWeightDown01sigma;
     FracRVWeightUp01sigma_ = FracRVWeightUp01sigma;
     LooseMvaSFDown01sigma_ = LooseMvaSFDown01sigma;
     LooseMvaSFUp01sigma_ = LooseMvaSFUp01sigma;
     NNLOPSweight_ = NNLOPSweight;
     PreselSFDown01sigma_ = PreselSFDown01sigma;
     PreselSFUp01sigma_ = PreselSFUp01sigma;
     THU_ggH_Mig01Down01sigma_ = THU_ggH_Mig01Down01sigma;
     THU_ggH_Mig01Up01sigma_ = THU_ggH_Mig01Up01sigma;
     THU_ggH_Mig12Down01sigma_ = THU_ggH_Mig12Down01sigma;
     THU_ggH_Mig12Up01sigma_ = THU_ggH_Mig12Up01sigma;
     THU_ggH_MuDown01sigma_ = THU_ggH_MuDown01sigma;
     THU_ggH_MuUp01sigma_ = THU_ggH_MuUp01sigma;
     THU_ggH_PT120Down01sigma_ = THU_ggH_PT120Down01sigma;
     THU_ggH_PT120Up01sigma_ = THU_ggH_PT120Up01sigma;
     THU_ggH_PT60Down01sigma_ = THU_ggH_PT60Down01sigma;
     THU_ggH_PT60Up01sigma_ = THU_ggH_PT60Up01sigma;
     THU_ggH_ResDown01sigma_ = THU_ggH_ResDown01sigma;
     THU_ggH_ResUp01sigma_ = THU_ggH_ResUp01sigma;
     THU_ggH_VBF2jDown01sigma_ = THU_ggH_VBF2jDown01sigma;
     THU_ggH_VBF2jUp01sigma_ = THU_ggH_VBF2jUp01sigma;
     THU_ggH_VBF3jDown01sigma_ = THU_ggH_VBF3jDown01sigma;
     THU_ggH_VBF3jUp01sigma_ = THU_ggH_VBF3jUp01sigma;
     THU_ggH_qmtopDown01sigma_ = THU_ggH_qmtopDown01sigma;
     THU_ggH_qmtopUp01sigma_ = THU_ggH_qmtopUp01sigma;
     TriggerWeightDown01sigma_ = TriggerWeightDown01sigma;
     TriggerWeightUp01sigma_ = TriggerWeightUp01sigma;
     centralObjectWeight_ = centralObjectWeight;
     electronVetoSFDown01sigma_ = electronVetoSFDown01sigma;
     electronVetoSFUp01sigma_ = electronVetoSFUp01sigma;
     

   } // vbf bsm ntuples to reweight

    else if( fIn[i] == "VBFHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8" )

      {

	weight_ = weight*0.55;
	CMS_hgg_mass_ = CMS_hgg_mass;
	dZ_ = dZ;
	tot_wt = tot_wt + weight_ * lumi ;
	tot_sq_wt += weight_ * lumi * weight_ * lumi; // Sum of squared weights                                                                                                             
	//passedEntries++;

	FracRVWeightDown01sigma_ = FracRVWeightDown01sigma;
	FracRVWeightUp01sigma_ = FracRVWeightUp01sigma;
	LooseMvaSFDown01sigma_ = LooseMvaSFDown01sigma;
	LooseMvaSFUp01sigma_ = LooseMvaSFUp01sigma;
	NNLOPSweight_ = NNLOPSweight;
	PreselSFDown01sigma_ = PreselSFDown01sigma;
	PreselSFUp01sigma_ = PreselSFUp01sigma;
	THU_ggH_Mig01Down01sigma_ = THU_ggH_Mig01Down01sigma;
	THU_ggH_Mig01Up01sigma_ = THU_ggH_Mig01Up01sigma;
	THU_ggH_Mig12Down01sigma_ = THU_ggH_Mig12Down01sigma;
	THU_ggH_Mig12Up01sigma_ = THU_ggH_Mig12Up01sigma;
	THU_ggH_MuDown01sigma_ = THU_ggH_MuDown01sigma;
	THU_ggH_MuUp01sigma_ = THU_ggH_MuUp01sigma;
	THU_ggH_PT120Down01sigma_ = THU_ggH_PT120Down01sigma;
	THU_ggH_PT120Up01sigma_ = THU_ggH_PT120Up01sigma;
	THU_ggH_PT60Down01sigma_ = THU_ggH_PT60Down01sigma;
	THU_ggH_PT60Up01sigma_ = THU_ggH_PT60Up01sigma;
	THU_ggH_ResDown01sigma_ = THU_ggH_ResDown01sigma;
	THU_ggH_ResUp01sigma_ = THU_ggH_ResUp01sigma;
	THU_ggH_VBF2jDown01sigma_ = THU_ggH_VBF2jDown01sigma;
	THU_ggH_VBF2jUp01sigma_ = THU_ggH_VBF2jUp01sigma;
	THU_ggH_VBF3jDown01sigma_ = THU_ggH_VBF3jDown01sigma;
	THU_ggH_VBF3jUp01sigma_ = THU_ggH_VBF3jUp01sigma;
	THU_ggH_qmtopDown01sigma_ = THU_ggH_qmtopDown01sigma;
	THU_ggH_qmtopUp01sigma_ = THU_ggH_qmtopUp01sigma;
	TriggerWeightDown01sigma_ = TriggerWeightDown01sigma;
	TriggerWeightUp01sigma_ = TriggerWeightUp01sigma;
	centralObjectWeight_ = centralObjectWeight;
	electronVetoSFDown01sigma_ = electronVetoSFDown01sigma;
	electronVetoSFUp01sigma_ = electronVetoSFUp01sigma;


      } // vbf mix ntuples to reweight

     Tout->Fill();
   }
  	
   // Calculate the MC statistical uncertainty                                                                                                                          
   //float stat_uncertainty = sqrt(passedEntries);
   float mc_stat_uncertainty = sqrt(tot_sq_wt);

   //std::cout << "Total entries passing selection: " << passedEntries << std::endl;
   //std::cout << "Statistical uncertainty: " << stat_uncertainty << std::endl;
   std::cout << "Total weight: " << tot_wt << std::endl;
   std::cout << "MC statistical uncertainty: " << mc_stat_uncertainty << std::endl;

   f->Close();
   fileout->cd();
   fileout->Write();
   fileout->Close();


}



