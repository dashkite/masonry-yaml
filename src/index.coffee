import YAML from "js-yaml"

Modularize =
  node: ( input ) -> "module.exports = #{ input }"
  browser: ( input ) -> "export default #{ input }"

Presets =

  js: ({ input, build  }) -> 
    if ( modularize = Modularize[ build.target ])?
      modularize JSON.stringify YAML.load input
    else
      throw new Error "masonry-yaml: 
        unknown YAML build target #{ build.target }"

yaml = ( context ) ->
  if ( preset = Presets[ context.build.preset ])?
    context.output = await preset context
    context
  else
    throw new Error "masonry-yaml: 
      unknown YAML preset #{ context.build.preset }"

export default yaml
export { yaml }
