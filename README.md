# Squares

# Instruction
## Command 
### For input n = 1000000 and  k = 4
`mix run lib/squares.exs 40 24`
or
`Elixir lib/squares.exs 40 24`

### Output
25
20
9
1



# Work Unit
1. We divide the task into ranges of 100 which becomes one work unit
2. Each work unit works on x to k+x within these ranges for every element, where x starts from the beginning of the range and moves to the end of the range with every iteration and k is received in the input


# Result for running program for input:
`mix run lib/squares.exs 1000000 4`


## Performance = (user+sys) / real = 2.52
`time mix run lib/squares.exs 1000000 4`

1. real    0m0.758s
2. user    0m1.697s
3. sys     0m0.194s


# Largest Problem solved:
`Elixir lib/squares.exs 1_000_000_000_000 4`

# Group Information
Members:
1. Anurag Bagalwadi (UFID: 4936 9125)
2. Fatema Saifee (UFID: 1508 1278)

# Additional Information
We also implemented an alternate solution using Genserver, the following is the performance we got.

## Input 
n=1_000_000, k=4

## Output
real    0m2.917s
user    0m3.377s
sys     0m0.397s
### Performance = (user+sys) / real = 1.29

Since we managed to achieve a better performance with the current solution, we decided to submit the same.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `squares` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:squares, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/squares](https://hexdocs.pm/squares).

