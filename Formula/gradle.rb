class Gradle < Formula
	desc "Open-source build automation tool based on the Groovy and Kotlin DSL"
	homepage "https://www.gradle.org/"
	url "https://services.gradle.org/distributions/gradle-4.10-rc-3-all.zip"
	sha256 "d566d4467f89acfceefa454779e471c9a9c6c5fa2b0bb4ca92e7ee9ca09fbc3f"
  
	bottle :unneeded
  
	depends_on :java => "1.8+"
  
	def install
	  rm_f Dir["bin/*.bat"]
	  libexec.install %w[bin docs lib media samples src]
	  (bin/"gradle").write_env_script libexec/"bin/gradle", Language::Java.overridable_java_home_env
	end
  
	test do
	  assert_match version.to_s, shell_output("#{bin}/gradle --version")
	end
  end
  