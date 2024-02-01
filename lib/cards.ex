defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def hello do
    "Hi there!"
  end

  def load(filename) do
    {_status, binary} = File.read(filename)
    :erlang.binary_to_term(binary)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def deal(deck, hand) do
    # Return a tuple of cards
    # The first is our hand, the second is remaining cards of the deck
    Enum.split(deck, hand)
  end

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    # Comprehension <-
    # Nested arrays
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    # we can call the Enum without make import in this file
    Enum.shuffle(deck)
  end

  # By convention we can use the question mark,
  # does not confer special behavior, it is only for
  # tell other developers that we are going to return true or false
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
