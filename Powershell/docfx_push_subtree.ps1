
git fetch;
git checkout master;
docfx docfx_project/docfx.json;
git add docs/* -f;
git commit -m "Docs CI build ";
git subtree push --prefix docs https://github.com/original-decisions/ci-cd.git gh-pages;