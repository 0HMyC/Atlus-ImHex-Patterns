#pragma author moddaman
#pragma endian little

struct dispName {
    u32 CharacterID [[color("FF5500"), comment("ID of character (nX_0_0_0.tmx)")]];
    u32 LearnedFlag [[color("FF00FF"), comment("Index of bitflag to determine if name has been learned")]];
    char InitName[17] [[color("00FF00"), comment("Initial name to display if LearnedFlag is Off (0)")]];
    char LearnedName[17] [[color("00FFFF"), comment("Name to use when LearnedFlag is set to On")]];
    u16 Field2A [[color("FFFF00"), comment("Unknown, padding?")]];
};

struct nameDAT {
    u32 NamesLength [[name("Size"), color("00BB00"), comment("Total length of all names in bytes")]];
    u32 TotalNames [[name("Total Names"), color("0000FF")]];
    dispName NameList[TotalNames];
    /*
        File may have extra bytes from here, but they're always just
        duplicated from the first X bytes of the file for padding
    */
};

nameDAT FILE @ 0 [[inline]];