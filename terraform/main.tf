resource "random_pet" "dog" {}

output "pet_name" {
  value = random_pet.dog.id
}

