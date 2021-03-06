proc findMaxValue*(arr: openArray[int]): int =
  ## Returns the value of maximum subarray
  if arr.len > 0:
    var store = newSeq[int](arr.len)
    store[0] = arr[0]
    result = arr[0]

    for idx in 1 ..< arr.len:
      store[idx] = store[idx - 1] + arr[idx]

      # can't get gains
      if store[idx] < 0:
        store[idx] = 0

      # store the max value
      if store[idx] > result:
        result = store[idx]

proc findMaxSubarray*(arr: openArray[int]): tuple[first, last, max: int] =
  if arr.len > 0:
    var store = newSeq[int](arr.len)
    store[0] = arr[0]

    for idx in 1 ..< arr.len:
      store[idx] = store[idx - 1] + arr[idx]
      if store[idx] < 0:
        store[idx] = 0

    var maxElem = store[0]
    var first = 0
    var last = 0
    for idx in 1 ..< store.len:
      if store[idx] > maxElem:
        maxElem = store[idx]
        last = idx

    first = last

    while first > 0:
      if store[first] == 0:
        inc(first)
        break
      dec(first)

    result = (first, last, maxElem)


when isMainModule:
  let data = [13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7]
  doAssert findMaxValue(data) == 43
  echo findMaxSubarray(data)
