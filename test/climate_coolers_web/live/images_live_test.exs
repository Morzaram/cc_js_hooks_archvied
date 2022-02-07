defmodule ClimateCoolersWeb.ImagesLiveTest do
  use ClimateCoolersWeb.ConnCase

  import Phoenix.LiveViewTest
  import ClimateCoolers.ProfilesFixtures

  @create_attrs %{alt: "some alt", url: "some url"}
  @update_attrs %{alt: "some updated alt", url: "some updated url"}
  @invalid_attrs %{alt: nil, url: nil}

  defp create_images(_) do
    images = images_fixture()
    %{images: images}
  end

  describe "Index" do
    setup [:create_images]

    test "lists all profile_images", %{conn: conn, images: images} do
      {:ok, _index_live, html} = live(conn, Routes.images_index_path(conn, :index))

      assert html =~ "Listing Profile images"
      assert html =~ images.alt
    end

    test "saves new images", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.images_index_path(conn, :index))

      assert index_live |> element("a", "New Images") |> render_click() =~
               "New Images"

      assert_patch(index_live, Routes.images_index_path(conn, :new))

      assert index_live
             |> form("#images-form", images: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#images-form", images: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.images_index_path(conn, :index))

      assert html =~ "Images created successfully"
      assert html =~ "some alt"
    end

    test "updates images in listing", %{conn: conn, images: images} do
      {:ok, index_live, _html} = live(conn, Routes.images_index_path(conn, :index))

      assert index_live |> element("#images-#{images.id} a", "Edit") |> render_click() =~
               "Edit Images"

      assert_patch(index_live, Routes.images_index_path(conn, :edit, images))

      assert index_live
             |> form("#images-form", images: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#images-form", images: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.images_index_path(conn, :index))

      assert html =~ "Images updated successfully"
      assert html =~ "some updated alt"
    end

    test "deletes images in listing", %{conn: conn, images: images} do
      {:ok, index_live, _html} = live(conn, Routes.images_index_path(conn, :index))

      assert index_live |> element("#images-#{images.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#images-#{images.id}")
    end
  end

  describe "Show" do
    setup [:create_images]

    test "displays images", %{conn: conn, images: images} do
      {:ok, _show_live, html} = live(conn, Routes.images_show_path(conn, :show, images))

      assert html =~ "Show Images"
      assert html =~ images.alt
    end

    test "updates images within modal", %{conn: conn, images: images} do
      {:ok, show_live, _html} = live(conn, Routes.images_show_path(conn, :show, images))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Images"

      assert_patch(show_live, Routes.images_show_path(conn, :edit, images))

      assert show_live
             |> form("#images-form", images: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#images-form", images: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.images_show_path(conn, :show, images))

      assert html =~ "Images updated successfully"
      assert html =~ "some updated alt"
    end
  end
end
