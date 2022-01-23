type t<'a, 'b> = Left('a) | Right('b)

let fromOption = (ma: option<'a>, e: unit => 'e): t<'e, 'a> => {
  switch ma {
  | Some(a) => Right(a)
  | None => Left(e())
  }
}

let toResult = (ma: t<'e, 'a>): Belt.Result.t<'e, 'a> => {
  switch ma {
  | Right(a) => Belt.Result.Ok(a)
  | Left(e) => Belt.Result.Error(e)
  }
}

let fromResult = (res: Belt.Result.t<'e, 'a>) => {
  switch res {
  | Ok(a) => Right(a)
  | Error(e) => Left(e)
  }
}

include Monad.Impl2({
  type t<'e, 'a> = t<'e, 'a>

  let make = a => Right(a)

  let flatMap = (ma, f) => {
    switch ma {
    | Right(a) => f(a)
    | Left(e) => Left(e)
    }
  }
})
