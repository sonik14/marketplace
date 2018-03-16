# -*- encoding: utf-8 -*-
# stub: pg 0.21.0 x86-mingw32 lib

Gem::Specification.new do |s|
  s.name = "pg"
  s.version = "0.21.0"
  s.platform = "x86-mingw32"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michael Granger", "Lars Kanis"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDPDCCAiSgAwIBAgIBAzANBgkqhkiG9w0BAQUFADBEMQ0wCwYDVQQDDARsYXJz\nMR8wHQYKCZImiZPyLGQBGRYPZ3JlaXotcmVpbnNkb3JmMRIwEAYKCZImiZPyLGQB\nGRYCZGUwHhcNMTcwNDA0MTgyNDE1WhcNMTgwNDA0MTgyNDE1WjBEMQ0wCwYDVQQD\nDARsYXJzMR8wHQYKCZImiZPyLGQBGRYPZ3JlaXotcmVpbnNkb3JmMRIwEAYKCZIm\niZPyLGQBGRYCZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDZb4Uv\nRFJfRu/VEWiy3psh2jinETjiuBrL0NeRFGf8H7iU9+gx/DI/FFhfHGLrDeIskrJx\nYIWDMmEjVO10UUdj7wu4ZhmU++0Cd7Kq9/TyP/shIP3IjqHjVLCnJ3P6f1cl5rxZ\ngqo+d3BAoDrmPk0rtaf6QopwUw9RBiF8V4HqvpiY+ruJotP5UQDP4/lVOKvA8PI9\nP0GmVbFBrbc7Zt5h78N3UyOK0u+nvOC23BvyHXzCtcFsXCoEkt+Wwh0RFqVZdnjM\nLMO2vULHKKHDdX54K/sbVCj9pN9h1aotNzrEyo55zxn0G9PHg/G3P8nMvAXPkUTe\nbrhXrfCwWRvOXA4TAgMBAAGjOTA3MAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0G\nA1UdDgQWBBRAHK81igrXodaDj8a8/BIKsaZrETANBgkqhkiG9w0BAQUFAAOCAQEA\nWbp+grpaqUH+RiXNXmi/5xBfvSYLbxWj+DZpCSnQW+DMfx46RVVko3b7BtKDs2zs\nEtKM6r6s7VbllPgcYUzaP92uzPqCw8FncvqG0+B+Nd4C2jKzPxAQyzYXv/3bQhv1\nsXAzEqLQqKx5V63eBDh1TPvPTEMfJwmjcdcbvMwFSt5EcUkT63W13ZJXX23JYp1K\nKRW+N1WIYz8RSBNaQIP2v5Inb9vUA+jPUOcdyLHoi205lyZ28hE4lcnh9Zs02aHs\nAo8FZozVJz8xVEuYNJsL2k70w0FiwXwoWyvKyekgPBvYNUj4JGDMtBBayJTOpDs7\n3EVmCm5IRuqZ1UcDFouQ9w==\n-----END CERTIFICATE-----\n"]
  s.date = "2017-06-13"
  s.description = "Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/].\n\nIt works with {PostgreSQL 9.1 and later}[http://www.postgresql.org/support/versioning/].\n\nA small example usage:\n\n  #!/usr/bin/env ruby\n\n  require 'pg'\n\n  # Output a table of current connections to the DB\n  conn = PG.connect( dbname: 'sales' )\n  conn.exec( \"SELECT * FROM pg_stat_activity\" ) do |result|\n    puts \"     PID | User             | Query\"\n    result.each do |row|\n      puts \" %7d | %-16s | %s \" %\n        row.values_at('procpid', 'usename', 'current_query')\n    end\n  end"
  s.email = ["ged@FaerieMUD.org", "lars@greiz-reinsdorf.de"]
  s.extra_rdoc_files = ["Contributors.rdoc", "History.rdoc", "Manifest.txt", "README-OS_X.rdoc", "README-Windows.rdoc", "README.ja.rdoc", "README.rdoc", "ext/errorcodes.txt", "POSTGRES", "LICENSE", "ext/gvl_wrappers.c", "ext/pg.c", "ext/pg_binary_decoder.c", "ext/pg_binary_encoder.c", "ext/pg_coder.c", "ext/pg_connection.c", "ext/pg_copy_coder.c", "ext/pg_errors.c", "ext/pg_result.c", "ext/pg_text_decoder.c", "ext/pg_text_encoder.c", "ext/pg_type_map.c", "ext/pg_type_map_all_strings.c", "ext/pg_type_map_by_class.c", "ext/pg_type_map_by_column.c", "ext/pg_type_map_by_mri_type.c", "ext/pg_type_map_by_oid.c", "ext/pg_type_map_in_ruby.c", "ext/util.c"]
  s.files = ["Contributors.rdoc", "History.rdoc", "LICENSE", "Manifest.txt", "POSTGRES", "README-OS_X.rdoc", "README-Windows.rdoc", "README.ja.rdoc", "README.rdoc", "ext/errorcodes.txt", "ext/gvl_wrappers.c", "ext/pg.c", "ext/pg_binary_decoder.c", "ext/pg_binary_encoder.c", "ext/pg_coder.c", "ext/pg_connection.c", "ext/pg_copy_coder.c", "ext/pg_errors.c", "ext/pg_result.c", "ext/pg_text_decoder.c", "ext/pg_text_encoder.c", "ext/pg_type_map.c", "ext/pg_type_map_all_strings.c", "ext/pg_type_map_by_class.c", "ext/pg_type_map_by_column.c", "ext/pg_type_map_by_mri_type.c", "ext/pg_type_map_by_oid.c", "ext/pg_type_map_in_ruby.c", "ext/util.c"]
  s.homepage = "https://bitbucket.org/ged/ruby-pg"
  s.licenses = ["BSD-3-Clause"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.required_ruby_version = Gem::Requirement.new(["< 2.5", ">= 2.0"])
  s.rubygems_version = "2.4.5.2"
  s.summary = "Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/]"

  s.installed_by_version = "2.4.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe-mercurial>, ["~> 1.4"])
      s.add_development_dependency(%q<hoe-deveiate>, ["~> 0.9"])
      s.add_development_dependency(%q<hoe-highline>, ["~> 0.2"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 1.0"])
      s.add_development_dependency(%q<rake-compiler-dock>, ["~> 0.6"])
      s.add_development_dependency(%q<hoe-bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.5"])
      s.add_development_dependency(%q<rdoc>, ["~> 5.1"])
      s.add_development_dependency(%q<hoe>, ["~> 3.16"])
    else
      s.add_dependency(%q<hoe-mercurial>, ["~> 1.4"])
      s.add_dependency(%q<hoe-deveiate>, ["~> 0.9"])
      s.add_dependency(%q<hoe-highline>, ["~> 0.2"])
      s.add_dependency(%q<rake-compiler>, ["~> 1.0"])
      s.add_dependency(%q<rake-compiler-dock>, ["~> 0.6"])
      s.add_dependency(%q<hoe-bundler>, ["~> 1.0"])
      s.add_dependency(%q<rspec>, ["~> 3.5"])
      s.add_dependency(%q<rdoc>, ["~> 5.1"])
      s.add_dependency(%q<hoe>, ["~> 3.16"])
    end
  else
    s.add_dependency(%q<hoe-mercurial>, ["~> 1.4"])
    s.add_dependency(%q<hoe-deveiate>, ["~> 0.9"])
    s.add_dependency(%q<hoe-highline>, ["~> 0.2"])
    s.add_dependency(%q<rake-compiler>, ["~> 1.0"])
    s.add_dependency(%q<rake-compiler-dock>, ["~> 0.6"])
    s.add_dependency(%q<hoe-bundler>, ["~> 1.0"])
    s.add_dependency(%q<rspec>, ["~> 3.5"])
    s.add_dependency(%q<rdoc>, ["~> 5.1"])
    s.add_dependency(%q<hoe>, ["~> 3.16"])
  end
end
