/****
/// Redirection file written by StartupFile quark.
/// open destination file with:
Document.open("/home/skmecs/.config/SuperCollider/startup_files/startup_minimal.scd");
StartupFile.open('startup_minimal');
/// choose or open files:
StartupFile.dialog;
***************************/

StartupFile.redirectLoad('startup_minimal');
