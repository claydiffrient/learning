defmodule GitAgeTest do
  use ExUnit.Case

  test "reads in files in the fixtures directory" do
    cur_dir = File.cwd!()
    fixtures_dir = cur_dir <> "/test/fixtures"
    expected_files = [
      fixtures_dir <> "/firstLevelFile.txt",
      fixtures_dir <> "/firstLevelFolder/secondLevelFile.txt",
      fixtures_dir <> "/firstLevelFolder/secondLevelFolder/thirdLevelFile.txt"
    ]
    actual_files = GitAge.open_directory(fixtures_dir)
    File.cd! cur_dir
    assert actual_files == expected_files
  end
end
