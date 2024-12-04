program ZUI_Demo;

uses
  System.SysUtils,
  System.StartUpCopy,
  FMX.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uZoomFrameForm in 'uZoomFrameForm.pas' {ZoomFrameForm},
  uZoomedLayoutForm in 'uZoomedLayoutForm.pas' {ZoomedLayoutForm},
  Zoomicon.Introspection.FMX.StructureView in '..\..\Zoomicon.Introspection\Zoomicon.Introspection.FMX.StructureView.pas' {StructureView: TFrame};

{$R *.res}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  {$IF DEFINED(MSWINDOWS)} //Trying to have more than 1 form throws Segmentation Fault exception on Android, probably on iOS too. Not sure about MacOS-X or Linux, probably it works for those
  ZoomFrameForm := TZoomFrameForm.Create(MainForm);
  ZoomFrameForm.Visible := true;

  //ZoomedLayoutForm := TZoomedLayoutForm.Create(MainForm).Visible := true; //TODO: NOT WORKING CORRECTLY
  //ZoomedLayoutForm.Visible := true;
  {$ENDIF}

  Application.Run;

  {$IF DEFINED(MSWINDOWS)}
  FreeAndNil(ZoomFrameForm);
  FreeAndNil(ZoomedLayoutForm);
  {$ENDIF}

end.
