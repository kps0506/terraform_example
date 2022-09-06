# 이곳은 그냥 예제를 입력해보는 파일

# variable 예제
variable "number_example" {
    description = "An example of a number variable in Terraform"
    type        = number
    default     = 42
}

variable "list_example" {
    description = "An example of a list in Terraform"
    type        = list
    default     = ["a", "b", "c"]
}

variable "list_numeric_example" {
    description = "An example of a numeric list in Terraform"
    type        = list(number)
    default     = [1, 2, 3]
}

variable "map_example" {
    description = "An example of a map in Terraform"
    type        = map(string)
    default     = {
        key1 = "value1"
        key2 = "value2"
        key3 = "value3"
    }
}

# object 또는 tuple 제약 조건을 사용하여 복잡한 구조적 유형(structural type)을 작성
