class Gradle < Formula
	desc "Open-source build automation tool based on the Groovy and Kotlin DSL"
	homepage "https://www.gradle.org/"
	url "https://services.gradle.org/distributions/gradle-4.10-rc-3-all.zip"
	sha256 "4e5f3a2e0c4f1f0313211253d799dd66570afdf0ebb3d785ee97a97d942c632d"
  
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
  