defmodule Cards do
  @moduledoc """
  Documentation for module Cards.
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

  @doc """
  Create hand, give 'hand_size', like this:

      iex(1)> Cards.create_hand(5)
  """
  def create_hand(hand_size) do
    #deck = Cards.create_deck()
    #deck = Cards.shuffle(deck)
    #_hand = Cards.deal(deck, hand_size)
    # Pipe operator |>, the second method receives like argument the last method returned
    # look at the Cards.deal, the first parameter is implicit
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

  @doc """
  read a file with my deck
  """
  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term binary
      :error -> "That file doesn't exist"
    end
  end

  @doc """
  save a file with my deck
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Return a tuple of cards
  """
  def deal(deck, hand) do
    # Return a tuple of cards
    # The first is our hand, the second is remaining cards of the deck
    Enum.split(deck, hand)
  end

  @doc """
  create a whole deck mixing values and suits
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    # Comprehension <-
    # Nested arrays
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffle my deck
  """
  def shuffle(deck) do
    # we can call the Enum without make import in this file
    Enum.shuffle(deck)
  end

  @doc """
  Indicated to me if I have a card
  """
  # By convention we can use the question mark,
  # does not confer special behavior, it is only for
  # tell other developers that we are going to return true or false
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
