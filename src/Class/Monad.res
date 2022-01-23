module Impl1 = (
  T: {
    type t<'a>
    let make: 'a => t<'a>
    let flatMap: (t<'a>, 'a => t<'b>) => t<'b>
  },
) => {
  include FlatMap.Impl1({
    type t<'a> = T.t<'a>
    let flatMap = T.flatMap
  })

  include Applicative.Impl1({
    type t<'a> = T.t<'a>
    let ap = (fab, fa) => {
      let map = (fa, f) => fa->flatMap(a => T.make(f(a)))
      flatMap(fab, f => map(fa, f))
    }
    let make = T.make
  })
}

module Impl2 = (
  T: {
    type t<'e, 'a>
    let make: 'a => t<'e, 'a>
    let flatMap: (t<'e, 'a>, 'a => t<'e, 'b>) => t<'e, 'b>
  },
) => {
  include FlatMap.Impl2({
    type t<'e, 'a> = T.t<'e, 'a>
    let flatMap = T.flatMap
  })

  include Applicative.Impl2({
    type t<'e, 'a> = T.t<'e, 'a>
    let ap = (fab, fa) => {
      let map = (fa, f) => fa->flatMap(a => T.make(f(a)))
      flatMap(fab, f => map(fa, f))
    }
    let make = T.make
  })
}