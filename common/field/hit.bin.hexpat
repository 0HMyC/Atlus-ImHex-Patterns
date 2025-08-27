#pragma author moddaman
#pragma endian little

import type.base;

// Comments with (Pio) are quoted from Pioziomgames/Pionome's template,
// all others from me

enum triggerTypes : u8 {
    Automatic = 0,
    Manual_2 = 2,
    Manual_4 = 4,
    Manual_6 = 6,
    Manual_7 = 7,
};

struct hitObject {
    s32 EnableFlag [[color("00FF00"), comment("Interaction will be enabled if the flag is on - (Pio)")]];
    type::Hex<u32> Field04[2] [[color("FF0000")]]; // Always 0xFFFFFFFF?
    u8 Field0C [[color("00DDDD")]]; // Bool toggle to force trigger on/off?
    triggerTypes Trigger [[color("00FFFF"), comment("Controls how object is interacted with")]];
    u16 NameIndex [[color("FFFF00"), comment("Index in a list of hardcoded names, 0 means no name - (Pio)")]];
    s16 ProcedureIndex [[color("FF00FF"), comment("Index of procedure to call from field's BF")]];
    s16 LoadFieldMajor [[color("777777"), comment("FXXX_000")]];
    s16 LoadFieldMinor [[color("000000"), comment("F000_XXX")]];
    s16 LoadFieldEntrance [[color("FFFF00")]];
    u16 Field18 [[color("FFFF00")]];
    u16 Field1A [[color("0000FF")]]; // Bool flag of some sort?
    type::Hex<u32> Field1C [[color("FFFF00")]]; // Always 0xFFFFFFFF?
    u32 Field20 [[color("0000FF")]]; // If Trigger is set to 7, this must equal 3?
    u32 DisableFlag [[color("FF8800"), comment("Interaction will be disabled if the flag is on - (Pio)")]];
    u32 Field28 [[color("FFFF00")]];
};

struct hitBIN {
    hitObject Objects[std::mem::size() / 44];
};

hitBIN FILE @ 0 [[inline]];