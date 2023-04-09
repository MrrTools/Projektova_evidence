
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CEOS_INTRADM"."PEV_T_LOVE_REMIDER_API" ("ID", "NAME", "NOTE_ICON", "NOTE_ICON_COLOR", "NOTE_HEADER", "NOTE_TEXT", "NOTE_COLOR", "CREATE_DATE") AS 
  select "ID", "NAME", "NOTE_ICON", "NOTE_ICON_COLOR", "NOTE_HEADER", "NOTE_TEXT",
    "NOTE_COLOR",  "CREATE_DATE"
 from PEV_T_LOVE_REMIDER;

   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_LOVE_REMIDER_API"."ID" IS 'PK pro note remider log ze CPM_S_NOTE_REMIDER_LOG';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_LOVE_REMIDER_API"."NAME" IS 'Name of reminder';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_LOVE_REMIDER_API"."NOTE_ICON" IS 'class for awesome icons for example "fa-exclamation-triangle"';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_LOVE_REMIDER_API"."NOTE_ICON_COLOR" IS 'colour for awesome icons for example "rgb(192,0,15)"';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_LOVE_REMIDER_API"."NOTE_HEADER" IS 'header text of notification';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_LOVE_REMIDER_API"."NOTE_TEXT" IS 'body html text for notification';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_LOVE_REMIDER_API"."NOTE_COLOR" IS 'colour for notofication entry "rgb(192,0,15)"';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_LOVE_REMIDER_API"."CREATE_DATE" IS 'datum vyvoreni';
   COMMENT ON TABLE "CEOS_INTRADM"."PEV_T_LOVE_REMIDER_API"  IS 'Tabulka notifikaci'
;

