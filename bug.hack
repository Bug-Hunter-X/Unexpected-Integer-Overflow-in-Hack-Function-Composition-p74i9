function foo(x: int): int {
  return x + 1;
}

function bar(x: int): int {
  return foo(x) * 2;
}

function baz(x: int): int {
  return bar(x) - 1;
}

function main(): void {
  var x: int = 5;
  var y: int = baz(x);
  echo y; // Expected output: 11, Actual output: 10
}

This code will produce unexpected output because of integer overflow.  The intermediate result in `bar` is 12, which is then reduced by 1 in `baz` resulting in 11.  However, the implementation of integer arithmetic may truncate results to 32 bits depending on the system and this overflow will result in a different output.  This is an uncommon error because it depends on specific implementation details and the size of the integers.