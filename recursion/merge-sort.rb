def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left_part = merge_sort(arr[0...mid])
  right_part = merge_sort(arr[mid..-1])

  merge(left_part, right_part)
end

def merge(left_part, right_part)
  merged = []
  until left_part.empty? || right_part.empty?
    if left_part.first <= right_part.first
      merged << left_part.shift
    else
      merged << right_part.shift
    end
  end
  merged + left_part + right_part
end

merge_sort([122, 45, 67, 43, 0, 56])
