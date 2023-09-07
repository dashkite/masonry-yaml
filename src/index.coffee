import YAML from "js-yaml"
import modularize from "@dashkite/masonry-export"

yaml = [
  ({ input }) -> JSON.stringify YAML.load input
  modularize 
]

export default yaml
export { yaml }
