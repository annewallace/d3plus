#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# Geo Map
#------------------------------------------------------------------------------
geo_map = (vars) ->

  topojson.presimplify vars.coords.value

  coords   = vars.coords.value
  key      = d3.keys(coords.objects)[0]
  topo     = topojson.feature coords, coords.objects[key]
  features = topo.features

  solo = vars.coords.solo.value
  mute = vars.coords.mute.value

  features = features.filter (f) ->
    if solo.length
      solo.indexOf(f[vars.id.value]) >= 0
    else if mute.length
      mute.indexOf(f[vars.id.value]) < 0
    else
      true

  features


# Visualization Settings and Helper Functions
geo_map.libs         = ["topojson"]
geo_map.nesting      = false
geo_map.requirements = ["coords"]
geo_map.scale        = 1
geo_map.shapes       = ["coordinates"]
geo_map.zoom         = true

module.exports = geo_map
