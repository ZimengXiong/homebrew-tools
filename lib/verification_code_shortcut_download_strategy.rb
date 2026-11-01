require "download_strategy"

class VerificationCodeShortcutDownloadStrategy < CurlDownloadStrategy
  def fetch(timeout: nil)
    lock = DownloadLock.new(temporary_path)
    begin
      lock.lock_or_wait(quiet: quiet?, timeout: timeout)
      return if cached_location.exist?

      match = url.match(%r{\Ahttps://github.com/(ZimengXiong/verification-code-shortcut)/releases/download/(v[0-9.]+)/([^/]+)\z})
      raise CurlDownloadStrategyError, url unless match

      temporary_path.dirname.mkpath
      system_command! HOMEBREW_PREFIX/"bin/gh",
                      args: ["release", "download", match[2], "--repo", match[1], "--pattern", match[3], "--output", temporary_path.to_s, "--clobber"]
      temporary_path.rename(cached_location)
    ensure
      lock.unlock
    end
  end
end
