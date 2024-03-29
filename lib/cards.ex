defmodule Cards do
  @moduledoc """
    Documentation for module Cards.
  """

  @doc """
    Create hand, give 'hand_size', like this:

  ## Examples

      iex> Cards.create_hand(5)
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
    Divides a deck into a hand and the remainder of the deck.
    `hand` argument indicates how many cards should be in the hand

  ## Examples

      iex(1)> deck = Cards.create_deck
      iex(2)> {hand, _deck} = Cards.deal(deck, 1)
      iex(3)> hand
      ["Ace of Spades"]
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
    Determines whether a deck contains a given card

  ### Example
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck,"Ace of Spades")
      true
  """
  def contains?(deck, card) do
    # By convention we can use the question mark, does not confer special behavior, it is only for
    # tell other developers that we are going to return true or false
    Enum.member?(deck, card)
  end
end
