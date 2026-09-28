import PracticeScreen from "../../PracticeScreen";

function one(value: string | string[] | undefined): string | null {
  return typeof value === "string" ? value : null;
}

// ?curso=&clase= say where the practice was opened from: where "Salir"
// goes back to, and which lesson to show if the node asks for a review.
export default async function Page(props: PageProps<"/practica/[nodo]">) {
  const { nodo } = await props.params;
  const search = await props.searchParams;
  return (
    <PracticeScreen
      nodeCode={decodeURIComponent(nodo)}
      courseCode={one(search.curso)}
      lessonCode={one(search.clase)}
    />
  );
}
