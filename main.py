from typing import List


def twoSum(nums: List[int], target: int) -> List[int]:
    seen = {}

    for i in range(len(nums)):
        current = nums[i]
        needed = target - current

        if needed in seen:
            return [seen[needed], i]

        seen[current] = i


nums = [2, 7, 11, 15]
target = 9

print(twoSum(nums, target))
