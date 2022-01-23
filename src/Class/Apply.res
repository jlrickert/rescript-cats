module Impl1 = (
  T: {
    type t<'a>
    let ap: (t<'a => 'b>, t<'a>) => t<'b>
    let map: (t<'a>, 'a => 'b) => t<'b>
  },
) => {
  let ap = T.ap
  include Functor.Impl1({
    type t<'a> = T.t<'a>
    let map = T.map
  })
}

module Impl2 = (
  T: {
    type t<'e, 'b>
    let ap: (t<'e, 'a => 'b>, t<'e, 'a>) => t<'e, 'b>
    let map: (t<'e, 'a>, 'a => 'b) => t<'e, 'b>
  },
) => {
  let ap = T.ap
  include Functor.Impl2({
    type t<'e, 'a> = T.t<'e, 'a>
    let map = T.map
  })
}
