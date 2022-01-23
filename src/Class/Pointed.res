module Impl1 = (
  T: {
    type t<'a>
    let make: 'a => t<'a>
  },
) => {
  let make = T.make
}

module Impl2 = (
  T: {
    type t<'b, 'a>
    let make: 'a => t<'b, 'a>
  },
) => {
  let make = T.make
}
