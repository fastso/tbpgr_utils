# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_with_index do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        expected: ['0:1:one', '1:2:two', '2:3:three'],
      },
      {
        case_no: 2,
        case_title: 'contain nil case',
        inputs: [[1, 2, 3], %w{one two}],
        expected: ['0:1:one', '1:2:two', '2:3:'],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = []
          c[:inputs].together_with_index do |first, second, index|
            actual << "#{index.to_s}:#{first}:#{second}"
          end

          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end
end