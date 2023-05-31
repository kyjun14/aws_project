provider "local" {
}

variable "names" {
	description = "A List of names"
	type        = list(string)
	default     = ["neo", "trinity", "morpheus"]
}

variable "hero_thousand_faces" {
	description = "map"
	type        = map(string)
	default     = {
		neo       = "hero"
		trinity   = "love interest"
		morpheus  = "mentor"
	}
}

output "upper_names" {
	value = [ for name in var.names : upper(name) if length(name) < 5 ]
}

output "bios" {
	value = [for name, role in var.hero_thousand_faces : "${name} is the ${role}"]
}

output "upper_roles" {
	value = {for name, role in var.hero_thousand_faces : upper(name) => upper(role)}
}

output "upper_names1" {
	value = [for name in var.names : upper(name)]
}

