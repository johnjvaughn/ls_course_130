class Hand
  RANKS_A_HIGH = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
                   '7' => 7, '8' => 8, '9' => 9, 'T' => 10,
                   'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }.freeze
  HAND_RANKINGS = { [1, 4] => 9, [2, 3] => 8, [1, 1, 3] => 3, [1, 2, 2] => 2,
                    [1, 1, 1, 2] => 1, [1, 1, 1, 1, 1] => 0 }.freeze

  attr_reader :ranking, :original_cards

  def initialize(cards)
    @original_cards = cards
    @cards = cards.clone
    normalize_hand
    @ranking = rank_hand
  end

  def sort_card_method(card_a, card_b, rank_counts)
    # sort by quads/trips/pairs first, then by high card
    count_a = rank_counts[card_a[0]]
    count_b = rank_counts[card_b[0]]
    return count_b <=> count_a unless count_a == count_b
    RANKS_A_HIGH[card_b[0]] <=> RANKS_A_HIGH[card_a[0]]
  end

  def normalize_hand
    rank_counts = Hash.new(0)
    @cards.each { |card| rank_counts[card[0]] += 1 }
    @cards.sort! { |a, b| sort_card_method(a, b, rank_counts) }
  end

  def count_pairs
    count = {}
    @cards.each do |card|
      if count.key?(card[0])
        count[card[0]] += 1
      else
        count[card[0]] = 1
      end
    end
    count.values.sort
  end

  def high_card_score
    num_cards = @cards.count
    score = 0
    @cards.each_with_index do |card, index|
      score += RANKS_A_HIGH[card[0]] * (13**(num_cards - index - 1))
    end
    score
  end

  def flush?
    @cards.all? { |card| card[1] == @cards.first[1] }
  end

  def straight?
    # we know coming in there are no matched ranks and cards are sorted,
    # highest rank first
    (RANKS_A_HIGH[@cards.first[0]] - RANKS_A_HIGH[@cards.last[0]] == 4) ||
      (@cards.first[0] == 'A' && @cards[1][0] == '5') # A 5 4 3 2 straight
  end

  def straight_flush?
    flush? && straight?
  end

  def rank_hand
    ranking = HAND_RANKINGS[count_pairs]
    if ranking == 0
      ranking = if straight_flush?
                  10
                elsif flush?
                  7
                elsif straight?
                  6
                else
                  0
                end
    end
    ranking * 1000000 + high_card_score
  end

  def <=>(other_cards)
    ranking <=> other_cards.ranking
  end
end

class Poker
  def initialize(hands)
    @hands = hands.map { |hand| Hand.new(hand) }
  end

  def best_hand
    max_ranking = @hands.max.ranking
    @hands.select { |hand| hand.ranking == max_ranking }
          .map(&:original_cards)
  end
end
