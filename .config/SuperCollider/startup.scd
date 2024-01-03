/****
/// Redirection file written by StartupFile quark.
/// open destination file with:
Document.open("/home/skmecs/.config/SuperCollider/startup_files/00_start_toba.scd");
StartupFile.open('00_start_toba');
/// choose or open files:
StartupFile.dialog;
***************************/

StartupFile.redirectLoad('00_start_toba');