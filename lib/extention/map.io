OperatorTable addOperator(":", 2)

: := method(value,
  list(self, value)
)

hash := "key": "value"
hash println

# curlyBrackets := method(
#   call message argsEvaluatedIn(call sender)
#   Map clone with()
# )

# { "key": "value", "1": 2 }
