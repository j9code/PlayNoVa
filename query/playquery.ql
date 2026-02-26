/* @name Leafletfunmap_query */

[out:json][timeout:180];

/* --- NoVA counties and independent cities (Virginia) --- */
(
  rel(962190);   /* Arlington County */
  rel(945043);   /* Fairfax County */
  rel(1149984);  /* Prince William County */
  rel(944948);   /* Loudoun County */
  rel(1633326);  /* Fauquier County */
  rel(206642);   /* Falls Church, VA */
  rel(206637);   /* Alexandria, VA */
  rel(206874);   /* Fairfax City, VA */
  rel(206870);   /* Manassas, VA */
  rel(206609);   /* Manassas Park, VA */
  rel(1633325);  /* Clarke County */
  rel(2534201);  /* Rappahannock County */
  rel(1633332);  /* Warren County */
  rel(2534173);  /* Culpeper County */
  rel(207046);   /* Front Royal, VA */
  rel(207037);   /* Winchester, VA */
  rel(207020);   /* Culpeper, VA  */
  rel(206975);   /* Berryville, VA */
);

map_to_area ->.region;

(
  /* leisure-based categories */
  nwr["leisure"~"^(miniature_golf|amusement_arcade|trampoline_park|escape_game|bowling_alley|indoor_play|water_park|gaming_lounge)$"](area.region);

  /* attraction-based categories */
  nwr["attraction"~"^(train|carousel|animal_scooter|slide|amusement_ride)$"](area.region);

  /* tourism-based categories */
  nwr["tourism"="zoo"](area.region);

  /* sport-based categories (semicolon-safe) */
  nwr["sport"~"(^|;)(climbing_adventure|laser_tag|karting|indoor_skydiving|10pin|roller_skating|ice_skating|zipline)(;|$)"](area.region);
);

out center;
