# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -rI "fdescribe(" AsyncDisplayKitSnapshotsTests/`.length > 1
fail("fit left in tests") if `grep -rI "fit(" AsyncDisplayKitSnapshotsTests/`.length > 1

# Ensure a clean commits history
if git.commits.any? { |c| c.message =~ /^Merge branch '#{github.branch_for_base}'/ }
  fail('Please rebase to get rid of the merge commits in this PR')
end

has_app_changes = !git.modified_files.grep(/AsyncDisplayKitSnapshots/).empty?
has_test_changes = !git.modified_files.grep(/AsyncDisplayKitSnapshotsTests/).empty?

# Non-trivial amounts of app changes without tests
if has_app_changes && !has_test_changes
  warn "This PR has app changes but is missing tests."
end

swiftlint.lint_files