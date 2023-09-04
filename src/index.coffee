import YAML from "js-yaml"
import modularize from "@dashkite/masonry-modularize"

Presets =
  
  json: ({ input }) -> JSON.stringify YAML.load input

  js: modularize ({ build, input }) -> 
      JSON.stringify YAML.load input

yaml = ( context ) ->
  if ( preset = Presets[ context.build.preset ])?
    preset context
  else
    throw new Error "Unknown YAML preset #{ context.build.preset }"

export { yaml }
