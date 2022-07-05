function is_magic(sq, pos)
    if pos < size(sq, 1)^2
        if mod(pos, size(sq, 1)) == 0
            num = pos ÷ size(sq, 1)
            for l = 1:num
                s2 = 0
                for k = 1:size(sq, 1)
                    s2 += sq[k, l]
                end
                if s2 != 34
                    return false
                end
            end
        end
        return true
    end
    s1 = s2 = 0
    for k = 1:size(sq, 1)
        s1 += sq[k, k]
        s2 += sq[size(sq, 1)-k+1, k]
    end
    if s1 != s2
        return false
    end
    for k = 1:size(sq, 1)
        s2 = 0
        for l = 1:size(sq, 1)
            s2 += sq[k, l]
        end
        if s1 != s2
            return false
        end
    end
    for k = 1:size(sq, 1)
        s2 = 0
        for l = 1:size(sq, 1)
            s2 += sq[l, k]
        end
        if s1 != s2
            return false
        end
    end
    return true
end

function place(sq, numbers, pos)

    for (n, v) in pairs(numbers)
        if !v
            continue
        end
        sq[pos] = n
        if is_magic(sq, pos)
            if pos == prod(size(sq))
                return true
            end
            numbers[n] = false
            if place(sq, numbers, pos + 1)
                return true
            end
            numbers[n] = true
        end
    end
    return false
end

function square(sz)
    num = sz^2
    sq = zeros(Int, sz, sz)
    numbers = trues(num)
    sq[1] = 11
    sq[2] = 14
    numbers[11] = false
    numbers[14] = false
    if place(sq, numbers, 3)
        return sq
    else
        return nothing
    end
end

square(4)