# cpm module resolving problem poc

`cpm` failed to resolve modules when using both `cpanfile.snapshot` and cpan mirror (darkpan).

## Case1. carton install --deployment (with PERL_CARTON_MIRROR)

```
+ '[' -d local ']'
+ rm -rf local
++ pwd
+ export PERL_CARTON_MIRROR=file:///Users/karupanerura/src/github.com/karupanerura/cpm-mirror-module-resolving-problem-poc/project/../darkpan
+ PERL_CARTON_MIRROR=file:///Users/karupanerura/src/github.com/karupanerura/cpm-mirror-module-resolving-problem-poc/project/../darkpan
+ carton install --deployment
Installing modules using /Users/karupanerura/src/github.com/karupanerura/cpm-mirror-module-resolving-problem-poc/project/cpanfile (deployment mode)
Successfully installed M-1.000001
Successfully installed Foo-Bar-0.01
2 distributions installed
Complete! Modules were installed into /Users/karupanerura/src/github.com/karupanerura/cpm-mirror-module-resolving-problem-poc/project/local
```

## Case2. cpm install --snapshot=cpanfile.snapshot --mirror=$MIRROR_URL

```
+ '[' -d local ']'
+ rm -rf local
++ pwd
+ cpm install --snapshot=cpanfile.snapshot --mirror=file:///Users/karupanerura/src/github.com/karupanerura/cpm-mirror-module-resolving-problem-poc/project/../darkpan
Loading distributions from cpanfile.snapshot...
DONE install Foo-Bar-0.01
FAIL install M-1.000001
1 distribution installed.
See /Users/karupanerura/.perl-cpm/build.log for details.
```

## Case3. cpm install --resolver=snapshot,http://cpan.metacpan.org --resolver=snapshot,$MIRROR_URL

```
+ '[' -d local ']'
+ rm -rf local
++ pwd
+ cpm install --resolver=snapshot,http://cpan.metacpan.org --resolver=snapshot,file:///Users/karupanerura/src/github.com/karupanerura/cpm-mirror-module-resolving-problem-poc/project/../darkpan
DONE install M-1.000001 (using prebuilt)
FAIL install Foo-Bar-0.01
1 distribution installed.
See /Users/karupanerura/.perl-cpm/build.log for details.
```

## Case4. cpm install  --resolver=snapshot,$MIRROR_URL --resolver=snapshot,http://cpan.metacpan.org

```
+ '[' -d local ']'
+ rm -rf local
++ pwd
+ cpm install --resolver=snapshot,file:///Users/karupanerura/src/github.com/karupanerura/cpm-mirror-module-resolving-problem-poc/project/../darkpan --resolver=snapshot,http://cpan.metacpan.org
DONE install Foo-Bar-0.01
FAIL install M-1.000001
1 distribution installed.
See /Users/karupanerura/.perl-cpm/build.log for details.
```
