module Impl1 = (
  T: {
    type t<'a>
    let map: (t<'a>, 'a => 'b) => t<'b>
  },
) => {
  let map = T.map
}

module Impl2 = (
  T: {
    type t<'e, 'a>
    let map: (t<'e, 'a>, 'a => 'b) => t<'e, 'b>
  },
) => {
  let map = T.map
}