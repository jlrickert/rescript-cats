module Impl2 = (
  T: {
    type t<'a, 'b>
    let chain: (t<'a, 'b>, 'b => t<'a, 'c>) => t<'a, 'c>
  },
) => {
  let chain = T.chain
}
