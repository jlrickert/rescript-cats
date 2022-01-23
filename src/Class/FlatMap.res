module Impl1 = (
  T: {
    type t<'a>
    let flatMap: (t<'a>, 'a => t<'b>) => t<'b>
  },
) => {
  let flatMap = T.flatMap
}

module Impl2 = (
  T: {
    type t<'e, 'a>
    let flatMap: (t<'e, 'a>, 'a => t<'e, 'b>) => t<'e, 'b>
  },
) => {
  let flatMap = T.flatMap
}
