module Impl1 = (
  T: {
    type t<'a>
    let make: 'a => t<'a>
    let ap: (t<'a => 'b>, t<'a>) => t<'b>
  },
) => {
  include Pointed.Impl1({
    type t<'a> = T.t<'a>
    let make = T.make
  })

  include Apply.Impl1({
    type t<'a> = T.t<'a>
    let ap = T.ap
    let map = (a, f) => make(f)->ap(a)
  })
}

module Impl2 = (
  T: {
    type t<'e, 'a>
    let make: 'a => t<'b, 'a>
    let ap: (t<'e, 'a => 'b>, t<'e, 'a>) => t<'e, 'b>
  },
) => {
  include Pointed.Impl2({
    type t<'e, 'a> = T.t<'e, 'a>
    let make = T.make
  })

  include Apply.Impl2({
    type t<'e, 'a> = T.t<'e, 'a>
    let ap = T.ap
    let map = (a, f) => make(f)->ap(a)
  })
}
