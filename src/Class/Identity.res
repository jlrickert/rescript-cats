module Impl1 = (
  T: {
    type t<'a>
  },
) => {
  type t<'a> = T.t<'a>
}

module Impl2 = (
  T: {
    type t<'e, 'a>
  },
) => {
  type t<'e, 'a> = T.t<'e, 'a>
}
