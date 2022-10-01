# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    head, tail, len, max_len = 0, 0, 0, 0

    while tail < s.size
        len = tail + 1 - head

        max_len = [len, max_len].max
        return max_len if s.size - head <= max_len

        if s[head..tail].include?(s[tail + 1])
            head += 1
            tail += 1 if tail < head
        else
            tail += 1
        end
    end

    max_len
end
s = "abcabcbabcab"
puts length_of_longest_substring(s)
