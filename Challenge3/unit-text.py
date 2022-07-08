# modules import
import unittest
import sac


class TestExtact(unittest.TestCase):
    def test_parse_path(self):
        self.assertEqual(sac.parse_path("x  / s / zz"), ["x", "s", "zz"])
        self.assertEqual(sac.parse_path("x  / s / "), ["x", "s", ""])

    def test_extract(self):
        self.assertEqual(sac.extract({"x": {"s": {"zz": "got"}}}
                                     , ["x", "s", "zz"]), "got")

        self.assertDictEqual(sac.extract({"x": {"s": {"zz": "got"}}}
                                     , ["x", "s",]), {"zz": "got"})

        self.assertRaises(Exception, sac.extract, ({"x": {"s": {"zz": "got"}}}, ["x", "z",]), "boom!")

if __name__ == '__main__':
    unittest.main()
