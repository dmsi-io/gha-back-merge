# frozen_string_literal: true

def commit_message
  if ENV['COMMIT_MESSAGE'].empty?
    "Merged #{ENV['SRC_BRANCH']} into #{ENV['DEST_BRANCH']}"
  else
    ENV['COMMIT_MESSAGE'].gsub('"', '\"')
  end
end

def main
  system("git config user.email #{ENV['COMMIT_AUTHOR_EMAIL']} && git config user.name #{ENV['COMMIT_AUTHOR_NAME']}")
  system('git fetch')
  system("git checkout #{ENV['DEST_BRANCH']}")
  system("git merge #{ENV['SRC_BRANCH']} --strategy-option theirs -m \"#{commit_message}\" --allow-unrelated-histories")
  system("git push -u origin #{ENV['DEST_BRANCH']}")
end

main if __FILE__ == $PROGRAM_NAME
