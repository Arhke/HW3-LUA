using System;
using _System;
using _module;
using Dafny;

namespace MiniC
{
  class Program
  {
    private static ISequence<Dafny.Rune> MakeRunes(string s) {
      return Sequence<Dafny.Rune>.UnicodeFromString(s);
    }
    static void Main(string[] args) {
      var watch = new System.Diagnostics.Stopwatch();
      if (args == null || args.Length != 2 || !(args[0] == "taint" || args[0] == "sectype")) {
        Console.WriteLine("Expected usage: main (taint|sectype) [filename.mc]");
        System.Environment.Exit(1);
      } else if (args[0] == "taint") {
        var filename = MakeRunes(args[1]);
        watch.Start();
        __default.RunCommandTaintAnalysis(filename);
        watch.Stop();
      } else {
        var filename = MakeRunes(args[1]);
        watch.Start();
        __default.RunCommandSecTypes(filename);
        watch.Stop();
      }
      Console.WriteLine($"Program complete in {watch.ElapsedMilliseconds} ms");
    }
  }
}
