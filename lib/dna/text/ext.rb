require "inline"

module Dna
  module Text
    module Ext
      inline do |builder|
        builder.include '<math.h>'

        builder.c %{
          int pattern_to_number(VALUE pattern) {
            int sum = 0;
            int symol_value = 0;
            int mult = 1;

            long int size =  RSTRING_LEN(pattern);

            VALUE A = rb_str_new2("A");
            VALUE C = rb_str_new2("C");
            VALUE G = rb_str_new2("G");

            for(int i = 0; i <= size - 1; i++) {
              VALUE sub = rb_str_substr(pattern, size - i - 1, 1);

              if (rb_str_cmp(sub, A) == 0) {
                symol_value = 0;
              } else if (rb_str_cmp(sub, C) == 0) {
                symol_value = 1;
              } else if (rb_str_cmp(sub, G) == 0) {
                symol_value = 2;
              } else {
                symol_value = 3;
              }

              sum += symol_value * mult;
              mult *= 4;
            }

            return sum;
          }
        }
      end
    end
  end
end
