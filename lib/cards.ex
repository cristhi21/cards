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

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    # Comprehension <-
    cards = for suit <- suits do
      for value <- values do
        "#{value} of #{suit}"
      end
    end
    ## Aplana las listas en una sola
    List.flatten(cards)
  end

  def shuffle(deck) do
    # podemos llamar Enum sin importar la libreria
    Enum.shuffle(deck)
  end

  # Por convencion podemos usar el signo de interrogacion,
  # no confiere un comportamiento especial, es solo para
  # indicar a otros desarrolladores que vamos a retornar true o false
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
