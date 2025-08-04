#pragma author moddaman
#pragma endian little

import type.base;

struct diaryEntry {
    // TODO: add comment()s describing what these are used for
    char Rank1[27];
    char Rank2[27];
    char Rank3[27];
    char Rank4[27];
    char Rank5[27];
    char Rank6[27];
    char Rank7[27];
    char Rank8[27];
    char Rank9[27];
    char RankMAX[27];
    char RankHoliday[27];
} [[single_color]];

struct cmmDiary{
    type::Hex<u32> DiaryLength [[name("Size"), color("0000FF"), comment("Length of all diary entries in bytes")]];
    u32 EntryCount [[color("FF00CC")]];
    diaryEntry Diaries[EntryCount];
    /*
        File may have extra bytes from here, but they're always just
        duplicated from the first X bytes of the file for padding
    */
};

cmmDiary FILE @ 0 [[inline]];