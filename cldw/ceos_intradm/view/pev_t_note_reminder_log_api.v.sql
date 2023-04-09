
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API" ("NOTE_ID", "NOTE_ICON", "NOTE_ICON_COLOR", "NOTE_HEADER", "NOTE_TEXT", "NOTE_LINK", "NOTE_COLOR", "NOTE_ACCEPT", "CREATE_DATE", "NOTE_ACCEPT_WHO", "NOTE_ACCEPT_WHEN") AS 
  select "NOTE_ID","NOTE_ICON", "NOTE_ICON_COLOR", "NOTE_HEADER", "NOTE_TEXT",
    "NOTE_LINK","NOTE_COLOR", "NOTE_ACCEPT", "CREATE_DATE", "NOTE_ACCEPT_WHO",
    "NOTE_ACCEPT_WHEN"
 from PEV_T_NOTE_REMIDER_LOG;

   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"."NOTE_ID" IS 'PK pro note remider log ze CPM_S_NOTE_REMIDER_LOG';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"."NOTE_ICON" IS 'class for awesome icons for example "fa-exclamation-triangle"';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"."NOTE_ICON_COLOR" IS 'colour for awesome icons for example "rgb(192,0,15)"';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"."NOTE_HEADER" IS 'header text of notification';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"."NOTE_TEXT" IS 'body html text for notification';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"."NOTE_LINK" IS 'URL for jump from notification';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"."NOTE_COLOR" IS 'colour for notofication entry "rgb(192,0,15)"';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"."NOTE_ACCEPT" IS 'Link URL or javascript, that is executed when press accept link (if left or null not accept is shown)';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"."CREATE_DATE" IS 'datum vyvoreni';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"."NOTE_ACCEPT_WHO" IS 'zapise se jmeno toho, kdov reminderu oznacil zpravu jako prectenou, pokud je zde username potom, hide from reminder v prehledu v aplikaci';
   COMMENT ON COLUMN "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"."NOTE_ACCEPT_WHEN" IS 'zapise se datum kdy nekdo v reminderu oznacil zpravu jako prectenou';
   COMMENT ON TABLE "CEOS_INTRADM"."PEV_T_NOTE_REMIDER_LOG_API"  IS 'Tabulka notifikaci'
;
