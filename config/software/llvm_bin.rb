name "llvm_bin"
default_version "3.8.1-1"

if linux?
  if _64_bit?
    source_md5 = "f9ab34e22c3a954a85812e0c2c8dc57a"
  else
    source_md5 = "9f27b397268bebddf1c37d7127702c97"
  end
elsif mac_os_x? && _64_bit?
  source_md5 = "1957a71b619fb68bb3b5cec5a56723d1"
end

source url: "http://crystal-lang.s3.amazonaws.com/llvm/llvm-#{version}-#{ohai['os']}-#{ohai['kernel']['machine']}.tar.gz",
       md5: source_md5

relative_path "llvm-#{version}"
